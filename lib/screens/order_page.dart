import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';
import 'package:uuid/uuid.dart';

class OrderedPage extends StatefulWidget {
  final List<CartItem> items;
  final String? restorationId;

  const OrderedPage({super.key, this.restorationId, required this.items});

  @override
  State<OrderedPage> createState() => _OrderedPageState();
}

class _OrderedPageState extends State<OrderedPage> with RestorationMixin {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerDate = TextEditingController();
  final TextEditingController controllerPersonCount = TextEditingController();
  String time = "";

  /// #calendar
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2023, 11, 1));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: (DateTime? newSelectedDate) {
      if (newSelectedDate != null) {
        setState(
          () {
            _selectedDate.value = newSelectedDate;
            debugPrint(_selectedDate.value.toString());
            controllerDate.text = _selectedDate.value.toString();
                //"${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}";
          },
        );
      }
    },
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2023),
          lastDate: DateTime(2030),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  Future<void> pushAlert(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          if (Platform.isAndroid) {
            /// #addroid uchun
            return AlertDialog(
              title: const Text("Attention"),
              content: const Text("Your order has been received"),
              actions: [
                TextButton(
                  onPressed: () {
                    final data = widget.items
                        .map((e) => OrderModelProduct(
                            quantity: e.quantity, products: e.products))
                        .toList();
                    localCubit.createHistoryOrder(item: data);
                    cartCubit.allDeleteItems(widget.items);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BasePages()),
                        (route) => false);
                  },
                  child: const Text("Ok"),
                ),
              ],
            );
          } else {
            /// #iPone uchun dialog
            return CupertinoAlertDialog(
              title: const Text("Ordered Successful"),
              content: const Text("Your order has been received"),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    final data = widget.items
                        .map((e) => OrderModelProduct(
                            quantity: e.quantity, products: e.products))
                        .toList();
                    localCubit.createHistoryOrder(item: data);
                    cartCubit.allDeleteItems(widget.items);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BasePages()),
                        (route) => false);
                  },
                  child: const Text("Ok"),
                ),
              ],
            );
          }
        });
  }

  void uploadButton() async {
    if (controllerName.text.isEmpty ||
        controllerPhone.text.isEmpty ||
        controllerPersonCount.text.isEmpty ||
        controllerDate.text.isEmpty ||
        time.isEmpty) {
      KTScaffoldMessage.scaffoldMessage(context, CustomString.fieldEmpty);
      return;
    } if(int.parse(controllerPersonCount.text) > 100 ||
        controllerName.text.length < 2 ||
       controllerPhone.text.length < 9
    ){
      KTScaffoldMessage.scaffoldMessage(context, CustomString.nameOrPerson);
    }else {
      pushAlert(context);
      final id = const Uuid().v4();
      final email = AuthService.user?.email;
      orderedCubit.orderPostProducts(
        id: id,
        email: email ?? "",
        name: controllerName.text.trim(),
        phone: controllerPhone.text.trim(),
        personCount: controllerPersonCount.text.trim(),
        deta: controllerDate.text.trim(),
        time: time,
        products: widget.items
            .map((e) =>
                OrderModelProduct(quantity: e.quantity, products: e.products))
            .toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.h),
        child: CustomAppBar(
          text: "Order Page",
          fontSize: 25,
          height: MediaQuery.sizeOf(context).height,
        ),
      ),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  /// #name
                  CustomTextFieldOrderPage(
                    controller: controllerName,
                    onSubmitted: (String text) {
                      if (Utils.regexNameFamily(text)) {
                        controllerName.text = text.trim();
                      } else {
                        KTScaffoldMessage.scaffoldMessage(
                            context, CustomString.nameMessage);
                        controllerName.text = "";
                      }
                    },
                    hintText: CustomString.nameFamily,
                    prefixIcon: CustomIcons.personOrder,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  /// #phone number
                  CustomTextFieldOrderPage(
                    controller: controllerPhone,
                    length: 9,
                    onSubmitted: (text) {
                      if (Utils.regexPhone(text)) {
                        controllerPhone.text = text;
                      } else {
                        KTScaffoldMessage.scaffoldMessage(
                            context, CustomString.addNumberMessage);
                        controllerPhone.text = "";
                      }
                    },
                    hintText: CustomString.phone,
                    keyboardType: TextInputType.phone,
                    prefixIcon: CustomIcons.phone,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  /// #Person Count
                  CustomTextFieldOrderPage(
                    onSubmitted: (text) {
                      if (int.parse(text) > 0 &&
                          int.parse(text) <= 100 &&
                          text.isNotEmpty) {
                        controllerPersonCount.text = text;
                      } else {
                        print("person count");
                        KTScaffoldMessage.scaffoldMessage(
                            context, CustomString.addNumberPeople);
                        controllerPersonCount.text = '';
                      }
                    },
                    controller: controllerPersonCount,
                    keyboardType: TextInputType.number,
                    hintText: CustomString.personAdd,
                    prefixIcon: CustomIcons.personAdd,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// #Date
                      SizedBox(
                        width: 150.w,
                        child: CustomTextFieldOrderPage(
                            controller: controllerDate,
                            readOnly: true,
                            keyboardType: TextInputType.number,
                            onPressed: () {
                              _restorableDatePickerRouteFuture.present();
                            },
                            hintText: CustomString.calendar,
                            prefixIcon: CustomIcons.calendar),
                      ),

                      /// #Time
                      PopupMenuButton<Widget>(
                        itemBuilder: (context) {
                          return [
                            for (int i = 0;
                                i < CustomString.timeList.length;
                                i++)
                              PopupMenuItem(
                                child: Text(
                                  CustomString.timeList[i],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 30),
                                ),
                                onTap: () {
                                  time = CustomString.timeList[i];
                                  setState(() {});
                                },
                              ),
                          ];
                        },
                        child: Container(
                          height: 55.h,
                          width: 150.w,
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: const Color.fromRGBO(80, 76, 85, 1),
                          ),
                          child: Row(
                            children: [
                              CustomIcons.time,
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                CustomString.time.isNotEmpty ? time
                                    :CustomString.time,
                                style: TextStyle(fontSize: 20.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: ElevatedButton(
                      onPressed: uploadButton,
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          MediaQuery.sizeOf(context).width,
                          45.h,
                        ),
                        backgroundColor: CustomColors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        alignment: Alignment.center,
                      ),
                      child: Text(
                        CustomString.next,
                        style: TextStyle(color: Colors.white, fontSize: 17.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
