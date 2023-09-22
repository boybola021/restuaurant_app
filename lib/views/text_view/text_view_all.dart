
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  String text;
  TextAlign? positionText;
  Color color;
  double fontSize;
  FontWeight fontWeight;
  TextDecoration decoration;
    CustomTextWidget({Key? key,
    required this.text,
    this.decoration = TextDecoration.none,
    this.positionText,
    this.color = Colors.white,
    this.fontWeight = FontWeight.w500,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: positionText,
      style: TextStyle(
       decoration: decoration,
          decorationThickness: 1.5,
          decorationStyle: TextDecorationStyle.solid,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}

