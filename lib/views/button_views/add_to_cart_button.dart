

import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';


class AddToCartButton extends StatelessWidget {
  final VoidCallback pressed;
  const AddToCartButton({super.key,required this.pressed});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        backgroundColor: CustomColors.pink,
        alignment: Alignment.center,
        fixedSize: Size(150.w, 45.h),
      ),
      onPressed: pressed,
      child: const Text("Added"),
    );
  }
}
