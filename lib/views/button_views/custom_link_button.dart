
import 'package:flutter/material.dart';

class CustomLinkButton extends StatelessWidget {
  final List<Widget> widget;
  const CustomLinkButton({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: 55,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: Colors.grey),
      ),
      child:  Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: widget,
      ),
    );
  }
}
