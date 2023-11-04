import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';
import 'package:restaurant_app/screens/forget_password.dart';
import 'package:uuid/uuid.dart';
import 'loading_page.dart';

class SignInScreen extends StatefulWidget {
   bool isValid;
   String? name;
   SignInScreen({Key? key,this.isValid = false,this.name}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController controllerEmail = TextEditingController();

  final TextEditingController controllerPassword = TextEditingController();
  static bool visibility = false;

  void checkLogIn() async {
    String email = controllerEmail.text.trim();
    String password = controllerPassword.text.trim();
    if (email.isEmpty ||
        password.isEmpty) {
      KTScaffoldMessage.scaffoldMessage(context, "Please fill out all fields");
      return;
    }
    showDialog(
        context: context,
        builder: (context){
          return const LoadingPage();
        });
    widget.isValid = false;
    final userLogIn = await AuthService.signIn(email, password);
     debugPrint(userLogIn.toString());
    if (userLogIn && context.mounted) {
      final userLogIn = UserSRC(
          id: const Uuid().v4(),
          name: widget.name ?? "No name",
          email: email,
          password: password,
          history: []);
      await localRepository.storeUser(userLogIn);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const BasePages()),
          (route) => false);
    } else if(context.mounted){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen(isValid: true,)));
      //KTScaffoldMessage.scaffoldMessage(context, CustomString.notLogin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.h),
        child: CustomAppBar(
          text: CustomString.logIn,
          fontSize: 30.sp,
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
                   CustomTextWidget(text: CustomString.email, fontSize: 20.sp),
                   CustomTextField(
                     onSubmitted: (String text) {
                       if (!Utils.regexEmail(text)) {
                         KTScaffoldMessage.scaffoldMessage(
                             context, CustomString.emailMessage);
                         controllerEmail.text = "";
                       }
                     },
                     prefix: CustomIcons.email,
                     controller: controllerEmail,
                     errorText: widget.isValid? CustomString.invalidValueEmail : null,
                   ),
                   SizedBox(height: 5.h,),
                   CustomTextWidget(
                     text: CustomString.password,
                     fontSize: 20.sp,
                   ),
                   CustomTextField(
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
                     errorText: widget.isValid? CustomString.invalidValuePass : null,
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
                           decoration: TextDecoration.underline,
                           decorationColor: Colors.red,
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
                     page: checkLogIn,
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
                       fontSize: 18.sp,
                       color: Colors.grey,
                     ),
                     TextButton(
                       onPressed: () {
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) =>  SignUpScreen()));
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
