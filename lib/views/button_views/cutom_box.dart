
import 'package:flutter/material.dart';

import '../../services/colors.dart';

class CustomBox extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  const CustomBox({Key? key,  this.height = 8, required this.width,  this.color = CustomColors.orange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration:  BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
