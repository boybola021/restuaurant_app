import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';
import 'package:restaurant_app/services/firebase_services/auth_service.dart';


class SignInScreen extends StatelessWidget {

  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  void checkLogIn(context)async{
   List login = logInRepository.readUser();
   final userLogIn = await AuthService.signIn(controllerEmail.text.trim(), controllerPassword.text.trim());
    if(userLogIn){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
    }else{
      KTScaffoldMessage.scaffoldMessage(context, CustomString.notLogin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body:  Column(
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
                Image(
                  image: CustomImages.googleLogo,
                  height: 25.h,
                  width: 45.w,
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
