


import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Icon prefix;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? errorText;
  final  void Function(String)?onSubmitted;
  const CustomTextField({Key? key,required this.prefix,required this.controller,this.suffixIcon,this.obscureText = false, this.onSubmitted,this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      obscureText: obscureText,
      onSubmitted: onSubmitted,
      textInputAction: TextInputAction.next,
      style: const TextStyle(fontSize: 23,),
      decoration:  InputDecoration(
        helperText: errorText,
        helperStyle: TextStyle(fontSize: 14.sp,color: Colors.red),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.pink)
        ),
        prefixIcon: prefix,
        suffixIcon: suffixIcon,
        filled: true,
      ),
    );
  }
}