import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/sign_up.dart';
import 'package:restaurant_app/src/service_locator.dart';
import 'package:restaurant_app/views/app_bar.dart';
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
   final login = logInRepository.readUser();
    if(controllerEmail.text == login.first.email && controllerEmail.text == login.first.password){
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
          const SizedBox(height: 10,),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextWidget(text: CustomString.email, fontSize: 20),
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
                  fontSize: 20,
                ),
                SizedBox(
                  height: 60,
                  child: CustomTextField(
                    prefix: CustomIcons.lock,
                    controller: controllerPassword,
                  ),
                ),
                const SizedBox(height: 30,),
                CustomButton(
                  page: () => checkLogIn(context),
                  text: CustomString.next,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          const CustomLinkButton(
              widget: [
                Image(
                  image: CustomImages.googleLogo,
                  height: 30,
                  width: 50,
                ),
                Spacer(),
                Center(
                  child: CustomTextWidget(text: CustomString.google, fontSize: 18),
                ),
                Spacer(),
              ]),
          const SizedBox(
            height: 20,
          ),
          const CustomLinkButton(
            widget: [
              CustomIcons.facebook,
              Spacer(),
              Center(
                child:
                CustomTextWidget(text: CustomString.facebook, fontSize: 18),
              ),
              Spacer(),
            ],
          ),
         const  SizedBox(height: 20,),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomTextWidget(
                  text: CustomString.already,
                  fontSize: 20,
                  color: Colors.grey,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                  },
                  clipBehavior: Clip.antiAlias,
                  child: const CustomTextWidget(
                    text: CustomString.signUp,
                    decoration: TextDecoration.underline,
                    fontSize: 22,
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
