import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) =>  SignInScreen()), (route) => false);
      },
      child: CustomTextWidget(
        text: CustomString.skip,
        fontSize: 23,
        color: CustomColors.orange,
      ),
    );
  }
}
