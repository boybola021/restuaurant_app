import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';
import 'package:restaurant_app/screens/forget_password.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController controllerEmail = TextEditingController();

  final TextEditingController controllerPassword = TextEditingController();
  static bool visibility = false;

  void checkLogIn(context) async {
    final userLogIn = await AuthService.signIn(
        controllerEmail.text.trim(), controllerPassword.text.trim());
    if (userLogIn) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const BasePages()),
          (route) => false);
    } else {
      KTScaffoldMessage.scaffoldMessage(context, CustomString.notLogin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.h),
        child: CustomAppBar(
          text: CustomString.logIn,
          fontSize: 25,
          height: MediaQuery.sizeOf(context).height,
        ),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
         if(state is AuthInitial){
           return ListView(
             padding:  EdgeInsets.symmetric(horizontal: 20.w),
             children: [
               SizedBox(height: 100.h,),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CustomTextWidget(text: CustomString.email, fontSize: 20),
                   Container(
                     height: 50.h,
                     alignment: Alignment.center,
                     child: CustomTextField(
                       onSubmitted: (String text) {
                         if (!Utils.regexEmail(text)) {
                           KTScaffoldMessage.scaffoldMessage(
                               context, CustomString.emailMessage);
                           controllerEmail.text = "";
                         }
                       },
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
                   Container(
                     height: 50.h,
                     alignment: Alignment.center,
                     child: CustomTextField(
                       prefix: CustomIcons.lock,
                       obscureText: visibility,
                       onSubmitted: (String text) {
                         if (!Utils.regexPassword(text)) {
                           KTScaffoldMessage.scaffoldMessage(
                               context, CustomString.passwordMessage);
                           controllerPassword.text = "";
                         }
                       },
                       suffixIcon: IconButton(
                         onPressed: () {
                           visibility = !visibility;
                           setState(() {});
                         },
                         icon: visibility
                             ? CustomIcons.visibility_off
                             : CustomIcons.visibility,
                       ),
                       controller: controllerPassword,
                     ),
                   ),
                   Align(
                     alignment: Alignment.centerRight,
                     child: TextButton(
                       onPressed: () {
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) =>
                                 const ForgetPassword()));
                       },
                       child: Text(
                         CustomString.forgetPasswordText,
                         style: TextStyle(
                           fontSize: 20.sp,
                           color: Colors.red,
                         ),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 30.h,
                   ),
                   CustomButton(
                     page: () => checkLogIn(context),
                     text: CustomString.next,
                   ),
                 ],
               ),
               SizedBox(
                 height: 30.h,
               ),
               CustomLinkButton(
                   widget: [
                 Image(
                   image: CustomImages.googleLogo,
                   height: 25.h,
                   width: 45.w,
                 ),
                 SizedBox(width: 10.w,),
                 Center(
                   child:
                   CustomTextWidget(text: CustomString.google, fontSize: 20.sp),
                 ),
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
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => const SignUpScreen()));
                       },
                       clipBehavior: Clip.antiAlias,
                       child: CustomTextWidget(
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
           );
         }else{
           return const Center(child: CircularProgressIndicator.adaptive(),);
         }
        },
      ),
    );
  }
}
