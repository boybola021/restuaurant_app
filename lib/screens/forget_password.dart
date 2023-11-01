
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController controllerEmail = TextEditingController();


  Future<void> pushAlert(BuildContext ctx) async {
    return showDialog(
        context: context,
        builder: (context) {
          if (Platform.isAndroid) {
            /// #addroid uchun
            return AlertDialog(
              title:  Text("Attention",textAlign: TextAlign.center,style: TextStyle(fontSize: 22.sp),),
              content:  Text("A message has been sent to your email",style: TextStyle(fontSize: 20.sp),),
              actions: [
                TextButton(
                  onPressed: ()async{
                    String email = controllerEmail.text;
                    if(!Utils.regexEmail(email)){
                      KTScaffoldMessage.scaffoldMessage(context, CustomString.somethingError);
                      return;
                    }else{
                       AuthService.forgetPassword(email);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()),);
                      }
                  },
                  child: const Text("Ok"),
                ),
              ],
            );
          } else {
            /// #iPone uchun dialog
            return CupertinoAlertDialog(
              title:  Text("Attention",textAlign: TextAlign.center,style: TextStyle(fontSize: 22.sp),),
              content:  Text("A message has been sent to your email",style: TextStyle(fontSize: 20.sp),),
              actions: [
                CupertinoDialogAction(
                  onPressed: ()async{
                    String email = controllerEmail.text;
                    if(!Utils.regexEmail(email)){
                      KTScaffoldMessage.scaffoldMessage(context, CustomString.somethingError);
                      return;
                    }else{
                      await AuthService.forgetPassword(email);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()),);
                    }
                  },
                  child: const Text("Ok"),
                ),
              ],
            );
          }
        },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.h),
        child: CustomAppBar(
          text: CustomString.forgotPasswordAppBar,
          fontSize: 25.sp,
          height: MediaQuery.sizeOf(context).height,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(text: CustomString.email, fontSize: 22),
            SizedBox(height: 5.h,),
            CustomTextField(
              controller: controllerEmail,
              onSubmitted: (text){
                if(!Utils.regexEmail(text)){
                  KTScaffoldMessage.scaffoldMessage(context, CustomString.emailMessage);
                }
              },
              prefix: CustomIcons.email,
            ),
            SizedBox(height: 20.h,),
            CustomButton(
              text: CustomString.next,
              page:(){
               if(Utils.regexEmail(controllerEmail.text)){
                 pushAlert(context);
               }else{
                 KTScaffoldMessage.scaffoldMessage(context, CustomString.emailMessage);
               }
              },
            ),
          ],
        ),
      ),
    );
  }
}