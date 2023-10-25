import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';


class TextFieldSearch extends StatelessWidget {
  final TextEditingController controller;
  const TextFieldSearch({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 45.h,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
            hintText: CustomString.search,
            filled: true,
            fillColor: Colors.transparent,
            border: InputBorder.none,
            prefixIcon: CustomIcons.searchIcon,
        ),
      ),
    );
  }
}
