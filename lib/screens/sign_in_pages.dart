import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/screens/sign_up.dart';
import 'package:restaurant_app/src/service_locator.dart';
import 'package:restaurant_app/views/custom_app_bar/app_bar.dart';
import 'package:restaurant_app/views/button_views/custom_link_button.dart';
import 'package:restaurant_app/views/button_views/cutom_button_next.dart';
import 'package:restaurant_app/views/custom_text_fild.dart';
import '../services/icons.dart';
import '../services/images.dart';
import '../services/strings.dart';
import '../views/text_view/text_view_all.dart';
import 'home_page.dart';

class SignInScreen extends StatelessWidget {

  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  void checkLogIn(BuildContext context){
   List login = logInRepository.readUser();
    if(controllerEmail.text.trim() == login.first.email && controllerPassword.text.trim() == login.first.password){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const CustomAppBar(text: CustomString.logIn),
           SizedBox(height: 10.h,),
             Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextWidget(
                  text: "C R A", fontWeight: FontWeight.w600, fontSize: 50),
              CustomIcons.restaurant,
              CustomTextWidget(
                text: "E",
                fontWeight: FontWeight.w600,
                fontSize: 50,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 CustomTextWidget(text: CustomString.email, fontSize: 20),
                SizedBox(
                  height: 60.h,
                  child: CustomTextField(
                    prefix: CustomIcons.email,
                    controller: controllerEmail,
                  ),
                ),
                 SizedBox(
                  height: 15.h,
                ),
                 CustomTextWidget(
                  text: CustomString.password,
                  fontSize: 20.sp,
                ),
                SizedBox(
                  height: 60.h,
                  child: CustomTextField(
                    prefix: CustomIcons.lock,
                    controller: controllerPassword,
                  ),
                ),
                 SizedBox(height: 30.h,),
                CustomButton(
                  page: () => checkLogIn(context),
                  text: CustomString.next,
                ),
              ],
            ),
          ),
           SizedBox(height: 30.h,),
           CustomLinkButton(
              widget: [
                const Image(
                  image: CustomImages.googleLogo,
                  height: 30,
                  width: 50,
                ),
               const  Spacer(),
                Center(
                  child: CustomTextWidget(text: CustomString.google, fontSize: 18),
                ),
                const Spacer(),
              ]),
           SizedBox(
            height: 20.h,
          ),
          CustomLinkButton(
            widget: [
              CustomIcons.facebook,
              const Spacer(),
              Center(
                child:
                CustomTextWidget(text: CustomString.facebook, fontSize: 18.sp),
              ),
             const  Spacer(),
            ],
          ),
           SizedBox(height: 20.h,),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextWidget(
                  text: CustomString.dontHaveAccount,
                  fontSize: 15.sp,
                  color: Colors.grey,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                  },
                  clipBehavior: Clip.antiAlias,
                  child:  CustomTextWidget(
                    text: CustomString.signUp,
                    decoration: TextDecoration.underline,
                    fontSize: 17.sp,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
