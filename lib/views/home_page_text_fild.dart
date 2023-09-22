import 'package:flutter/material.dart';
import 'package:restaurant_app/services/icons.dart';
import '../services/strings.dart';

class TextFieldSearch extends StatelessWidget {
  final TextEditingController controller;
  const TextFieldSearch({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: TextField(
        controller: controller,
        decoration:  const InputDecoration(
            hintText: CustomString.search,
            filled: true,
            border: InputBorder.none,
            prefixIcon: CustomIcons.searchIcon,
        ),
      ),
    );
  }
}
