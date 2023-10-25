



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';


class CustomShopPageProducts extends StatelessWidget {
  final List<CartItem>item;
  const CustomShopPageProducts({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        for (var items in item)
          Container(
            margin:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
            padding:  EdgeInsets.symmetric(horizontal: 15.h,vertical: 5.h),
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
                  alignment: Alignment.center,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(
                    items.products.imageUrl.first,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 20,),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          items.products.name.length < 10 ? items.products.name : items.products.name.replaceRange(10, null, "..."),
                          style: const TextStyle(fontSize: 20),
                        ),
                        SizedBox(width: 20.w,),
                        Text(
                          items.total.toStringAsFixed(2),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                                Radius.circular(10)),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {
                                  cartCubit.addToCard(
                                      product: items.products, quantity: -1);
                                },
                                icon: const Icon(Icons.remove),
                              ),
                              Text(items.quantity.toString(),style: const TextStyle(fontSize: 20,color: Colors.grey),),
                              IconButton(
                                onPressed: () {
                                  cartCubit.addToCard(
                                      product: items.products, quantity: 1);
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15.w,),
                        IconButton(
                          onPressed: () {
                            cartCubit.deleteCartItem(items);
                          },
                          icon: const Icon(CupertinoIcons.delete),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}
