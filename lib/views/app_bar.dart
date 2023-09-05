
import 'package:flutter/material.dart';
import 'package:restaurant_app/views/text_view/text_view_all.dart';

import '../services/colors.dart';
import '../services/strings.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  const CustomAppBar({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    return  Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: h * 0.18,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: CustomColors.pink,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        child:  CustomTextWidget(
            text: text,
            fontSize: 35,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
