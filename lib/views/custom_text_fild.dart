


import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Icon prefix;
  const CustomTextField({Key? key,required this.prefix,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      style: const TextStyle(fontSize: 23,),
      decoration:  InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: prefix,
        filled: true,
      ),
    );
  }
}