



import 'package:flutter/material.dart';

class CustomTextFieldOrderPage extends StatelessWidget {
  final TextEditingController controller;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final VoidCallback? onPressed;
  final void Function(String)? onSubmitted;
  final String hintText;
  final bool readOnly;
  const CustomTextFieldOrderPage({super.key, required this.controller,this.prefixIcon, this.keyboardType,this.onPressed, this.readOnly = false,required this.hintText, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      readOnly: readOnly,
      controller: controller,
      onTap: onPressed,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 20,),
      decoration:  InputDecoration(

        border: const OutlineInputBorder(
        ),
        prefixIcon: prefixIcon,
        hintText: hintText,
        filled: true,
      ),
    );
  }
}
