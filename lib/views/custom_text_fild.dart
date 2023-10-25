


import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Icon prefix;
  final Widget? suffixIcon;
  final bool obscureText;
  final  void Function(String)?onSubmitted;
  const CustomTextField({Key? key,required this.prefix,required this.controller,this.suffixIcon,this.obscureText = false, this.onSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      obscureText: obscureText,
      onSubmitted: onSubmitted,
      style: const TextStyle(fontSize: 23,),
      decoration:  InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: prefix,
        suffixIcon: suffixIcon,
        filled: true,
      ),
    );
  }
}