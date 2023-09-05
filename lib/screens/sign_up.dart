import 'dart:math';

import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/home_page.dart';
import 'package:restaurant_app/screens/sign_in_pages.dart';
import 'package:restaurant_app/services/icons.dart';
import 'package:restaurant_app/services/strings.dart';
import 'package:restaurant_app/src/service_locator.dart';
import 'package:restaurant_app/views/app_bar.dart';
import 'package:restaurant_app/views/button_views/cutom_button_next.dart';
import 'package:restaurant_app/views/custom_text_fild.dart';
import 'package:restaurant_app/views/text_view/text_view_all.dart';
import '../src/user_login_model.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  static List<User> list = [];
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();


  void saveLogIn(BuildContext context) async {
    String name = controllerName.value.text.trim();
    String email = controllerEmail.value.text.trim();
    String password = controllerPassword.value.text.trim();
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please fill out all fields")));
      return;
    }
    final userLogIn = User(id: Random().nextInt(1000), name: name, email: email, password: password);

    final result = await logInRepository.storeUser(userLogIn);
    if(result) {
      Navigator.push(context,MaterialPageRoute(builder: (context) =>  SignInScreen()));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Some thing error, try again later")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const CustomAppBar(text: CustomString.signUp),
          const SizedBox(
            height: 10,
          ),
          const Row(
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
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextWidget(
                  text: CustomString.name,
                  fontSize: 22,
                ),
                SizedBox(
                  height: 60,
                  child: CustomTextField(
                    prefix: CustomIcons.person,
                    controller: controllerName,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomTextWidget(text: CustomString.email, fontSize: 22),
                SizedBox(
                  height: 60,
                  child: CustomTextField(
                    prefix: CustomIcons.email,
                    controller: controllerEmail,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomTextWidget(
                  text: CustomString.password,
                  fontSize: 22,
                ),
                SizedBox(
                  height: 60,
                  child: CustomTextField(
                    prefix: CustomIcons.lock,
                    controller: controllerPassword,
                  ),
                ),
              ],
            ),
          ),
           const Spacer(flex: 1,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 30,),
             child: CustomButton(
              page: () => saveLogIn(context),
              text: CustomString.next,
          ),
           ),
           const SizedBox(height: 10,),
          const Spacer(flex: 3,),
        ],
      ),
    );
  }
}

