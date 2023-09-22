

import 'package:flutter/material.dart';
import '../../screens/sign_in_pages.dart';
import '../../services/colors.dart';
import '../../services/strings.dart';
import '../text_view/text_view_all.dart';

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
