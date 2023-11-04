import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/cubit/local_src/local_cubit.dart';
import 'package:restaurant_app/packages_all.dart';
import 'package:restaurant_app/screens/loading_page.dart';

class HistoryOrderProductPage extends StatefulWidget {
  const HistoryOrderProductPage({super.key});

  @override
  State<HistoryOrderProductPage> createState() =>
      _HistoryOrderProductPageState();
}

class _HistoryOrderProductPageState extends State<HistoryOrderProductPage> {

  @override
  void initState() {
    super.initState();
    localCubit.getHistoryOrder();
  }

  Future<void> clearHistoryLocal(context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          if (Platform.isAndroid) {
            /// addroid uchun
            return AlertDialog(
              title: const Text("Attention"),
              content: const Text("Do you really want to clear history"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No"),
                ),
                TextButton(
                  onPressed: () async {
                    final clearHistory = await localCubit.clearHistoryOrder();
                    if (clearHistory) {
                      Navigator.pop(context);
                    } else {
                      KTScaffoldMessage.scaffoldMessage(
                          context, CustomString.somethingError);
                    }
                  },
                  child: const Text("Yes"),
                ),
              ],
            );
          } else {
            /// iPone uchuun dialog
            return CupertinoAlertDialog(
              title: const Text("Attention"),
              content: const Text("Do you really want to clear history"),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No"),
                ),
                CupertinoDialogAction(
                  onPressed: () async {
                    final clearHistory = await localCubit.clearHistoryOrder();
                    if (clearHistory) {
                      Navigator.pop(context);
                    } else {
                      KTScaffoldMessage.scaffoldMessage(
                          context, CustomString.somethingError);
                    }
                  },
                  child: const Text("Yes"),
                ),
              ],
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "History Page",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
        ),
        actions: [
          BlocBuilder<LocalCubit, LocalState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  if (state is LocalOrderGetState) {
                   if(state.item.isNotEmpty){
                     clearHistoryLocal(context);
                   }
                  }
                },
                icon: CustomIcons.delete,
              );
            },
          ),
          const SizedBox(width: 10,),
        ],
      ),
      body: BlocBuilder<LocalCubit, LocalState>(
        builder: (context, state) {
          if (state is LocalOrderGetState) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
              itemCount: state.item.length,
              itemBuilder: (context, i) {
                final items = state.item[i];
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 5.h),
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 90.w,
                        height: 100.h,
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        /// #image
                        child:  CachedNetworkImage(
                          imageUrl: items.products.imageUrl,
                          placeholder: (context,url) => const ColoredBox(
                            color: Colors.transparent,
                          ),
                          errorWidget: (context,url,error) => const Icon(Icons.error),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                items.products.name.length < 10
                                    ? items.products.name
                                    : items.products.name
                                    .replaceRange(10, null, "..."),
                                style: const TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                (items.products.price * items.quantity)
                                    .toStringAsFixed(0),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Quantity: ",
                                style: TextStyle(fontSize: 23.sp),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                items.quantity.toString(),
                                style: TextStyle(fontSize: 23.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
          if (state is LocalLoadingState) {
            return const LoadingPage();
          }
          if (state is LocalFailureState) {
            return Center(child: Text(
              "History Empty", style: TextStyle(fontSize: 25.sp),),);
          }
          if (state is LocalOrderCleanState) {
            return Center(child: Text(
              "History Empty", style: TextStyle(fontSize: 25.sp),),);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
