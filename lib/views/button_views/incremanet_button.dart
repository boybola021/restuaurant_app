
import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';

class IncrDeceButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;

  const IncrDeceButton(
      {super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.w,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: CustomColors.pink,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
