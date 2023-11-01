import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';
import 'package:restaurant_app/screens/loading_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static bool visibility = false;
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerPrePassword = TextEditingController();

  void saveLogIn() async {
    String name = controllerName.value.text.trim();
    String email = controllerEmail.value.text.trim();
    String password = controllerPassword.value.text.trim();
    String prePassword = controllerPrePassword.value.text.trim();
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        prePassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please fill out all fields")));
      return;
    }

    final checkSignUp =
        Utils.validateRegistration(name, email, password, prePassword);
    if (checkSignUp && context.mounted) {
      bool response = await AuthService.signUp(email, password, name);
      if (response) {
        final userLogIn = UserSRC(
            id: Random().nextInt(1000),
            name: name,
            email: email,
            password: password,
            history: []);
        await localRepository.storeUser(userLogIn);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignInScreen()));
      } else {
        KTScaffoldMessage.scaffoldMessage(
            context, CustomString.accountServerError);
      }
    } else {
      KTScaffoldMessage.scaffoldMessage(context, CustomString.somethingError);
    }
  }

  @override
  void dispose() {
    super.dispose();
    controllerName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerPrePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.h),
        child: CustomAppBar(
          text: CustomString.signUp,
          height: h * 0.14,
        ),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
         if(state is AuthInitial){
           return Stack(
             children: [
               ListView(
                 padding: EdgeInsets.symmetric(vertical: 50.h),
                 children: [
                   Padding(
                     padding:
                     const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         CustomTextWidget(
                           text: CustomString.name,
                           fontSize: 22.sp,
                         ),

                         /// #name text field
                         CustomTextField(
                           onSubmitted: (String text) {
                             if (!Utils.regexName(text)) {
                               KTScaffoldMessage.scaffoldMessage(
                                   context, CustomString.nameMessage);
                               controllerName.text = "";
                             }
                           },
                           prefix: CustomIcons.person,
                           controller: controllerName,
                         ),
                         SizedBox(
                           height: 15.h,
                         ),
                         CustomTextWidget(text: CustomString.email, fontSize: 22),

                         /// #email text field
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
                         ),
                         SizedBox(
                           height: 15.h,
                         ),
                         CustomTextWidget(
                           text: CustomString.password,
                           fontSize: 22,
                         ),

                         /// #password text field
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
                                 ? const Icon(Icons.visibility_off)
                                 : const Icon(Icons.visibility),
                           ),
                           controller: controllerPassword,
                         ),
                         SizedBox(
                           height: 15.h,
                         ),
                         CustomTextWidget(
                             text: CustomString.prePassword, fontSize: 22),

                         /// #prePassword
                         CustomTextField(
                           prefix: CustomIcons.lock,
                           obscureText: visibility,
                           onSubmitted: (String text) {
                             if (controllerPrePassword.text.trim() !=
                                 controllerPassword.text.trim()) {
                               KTScaffoldMessage.scaffoldMessage(
                                   context, CustomString.confirmMessage);
                               controllerPrePassword.text = "";
                             }
                           },
                           suffixIcon: IconButton(
                             onPressed: () {
                               visibility = !visibility;
                               setState(() {});
                             },
                             icon: visibility
                                 ? const Icon(Icons.visibility_off)
                                 : const Icon(Icons.visibility),
                           ),
                           controller: controllerPrePassword,
                         ),
                       ],
                     ),
                   ),
                   SizedBox(
                     height: 20.h,
                   ),
                   Center(
                     child: Row(
                       mainAxisSize: MainAxisSize.min,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         CustomTextWidget(
                           text: CustomString.already,
                           fontSize: 15.sp,
                           color: Colors.grey,
                         ),
                         TextButton(
                           onPressed: () {
                             Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                     builder: (context) => SignInScreen()));
                           },
                           clipBehavior: Clip.antiAlias,
                           child: CustomTextWidget(
                             text: CustomString.signIn,
                             decoration: TextDecoration.underline,
                             fontSize: 17.sp,
                             color: Colors.red,
                           ),
                         ),
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(
                       horizontal: 30,
                     ),
                     child: CustomButton(
                       page: saveLogIn,
                       text: CustomString.next,
                     ),
                   ),
                   SizedBox(
                     height: 10.h,
                   ),
                 ],
               ),
               if(state is AuthLoadingState)const LoadingPage(),
             ],
           );
         }
          else{
           return const Center(child: CircularProgressIndicator.adaptive(),);
         }
        },

      ),
    );
  }
}
