import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';
import 'package:restaurant_app/services/firebase_services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static bool visibility = false;
  final FocusNode focusNode = FocusNode();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerPrePassword = TextEditingController();

  void saveLogIn(context) async {
    String name = controllerName.value.text.trim();
    String email = controllerEmail.value.text.trim();
    String password = controllerPassword.value.text.trim();
    String prePassword = controllerPrePassword.value.text.trim();
    if (name.isEmpty || email.isEmpty || password.isEmpty || prePassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please fill out all fields")));
      return;
    }

    final checkSignUp = Utils.validateRegistration(name, email, password, prePassword);
    if(checkSignUp && context.mounted) {
      final auth = await AuthService.signUp(email, password, name);
      final userLogIn = UserSRC(id: Random().nextInt(1000), name: name, email: email, password: password);
      final result = await logInRepository.storeUser(userLogIn);
      Navigator.push(context,MaterialPageRoute(builder: (context) =>   SignInScreen()));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something error, try again later")));
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
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              CustomAppBar(text: CustomString.signUp,height: h * 0.14,),
              const SizedBox(
                height: 10,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextWidget(
                      text: "C R A", fontWeight: FontWeight.w600, fontSize: 50.sp),
                CustomIcons.restaurant,
                  CustomTextWidget(
                    text: "E",
                    fontWeight: FontWeight.w600,
                    fontSize: 50.sp,
                  ),
                ],
              ),
               SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     CustomTextWidget(
                      text: CustomString.name,
                      fontSize: 22.sp,
                    ),
                    /// #name text field
                    SizedBox(
                      height: 60.h,
                      child: CustomTextField(
                        onSubmitted: (String text){
                          if(!Utils.regexName(text)){
                            KTScaffoldMessage.scaffoldMessage(context, CustomString.nameMessage);
                            controllerName.text = "";
                          }
                        },
                        prefix: CustomIcons.person,
                        controller: controllerName,
                      ),
                    ),
                     SizedBox(
                      height: 15.h,
                    ),
                     CustomTextWidget(text: CustomString.email, fontSize: 22),
                    /// #email text field
                    SizedBox(
                      height: 60.h,
                      child: CustomTextField(
                        onSubmitted: (String text){
                          if(!Utils.regexEmail(text)){
                            KTScaffoldMessage.scaffoldMessage(context, CustomString.emailMessage);
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
                      fontSize: 22,
                    ),
                    /// #password text field
                    SizedBox(
                      height: 60,
                      child: CustomTextField(
                        prefix: CustomIcons.lock,
                        obscureText: visibility,
                          onSubmitted: (String text){
                            if(!Utils.regexPassword(text)){
                              KTScaffoldMessage.scaffoldMessage(context, CustomString.passwordMessage);
                              controllerPassword.text = "";
                            }
                        },
                        suffixIcon: IconButton(
                          onPressed: (){
                            visibility = !visibility;
                            setState(() {});
                          },
                          icon:visibility? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                        ),
                        controller: controllerPassword,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextWidget(text: CustomString.prePassword, fontSize: 22),
                    /// #prePassword
                    SizedBox(
                      height: 60,
                      child: CustomTextField(
                        prefix: CustomIcons.lock,
                        obscureText: visibility,
                        onSubmitted: (String text){
                          if(controllerPrePassword.text.trim() != controllerPassword.text.trim()){
                            KTScaffoldMessage.scaffoldMessage(context, CustomString.confirmMessage);
                            controllerPrePassword.text = "";
                          }
                        },
                        suffixIcon: IconButton(
                          onPressed: (){
                            visibility = !visibility;
                            setState(() {});
                          },
                          icon:visibility? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                        ),
                        controller: controllerPrePassword,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
                      },
                      clipBehavior: Clip.antiAlias,
                      child:  CustomTextWidget(
                        text: CustomString.signIn,
                        decoration: TextDecoration.underline,
                        fontSize: 17.sp,
                        color: Colors.red,
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
                SizedBox(height: 10.h,),
             // const Spacer(flex: 3,),
            ],
          ),
        ],
      ),
    );
  }
}


