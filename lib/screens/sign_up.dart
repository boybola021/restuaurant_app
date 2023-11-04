import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';
import 'package:restaurant_app/screens/loading_page.dart';

class SignUpScreen extends StatefulWidget {
    bool isInvalid;
   SignUpScreen({Key? key,this.isInvalid = false}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static bool visibility = false;
  static bool loading = false;
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
    widget.isInvalid = false;
    final checkSignUp =
        Utils.validateRegistration(name, email, password, prePassword);
    if (checkSignUp) {
      showDialog(
          context: context,
          builder: (context){
            return const LoadingPage();
          });
      bool response = await AuthService.signUp(email, password, name);
      if (response && context.mounted) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  SignInScreen(name: controllerName.text.trim(),)));
      } else if(context.mounted && !response){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  SignUpScreen(isInvalid: true,)));
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
          if (state is AuthLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          else if (state is AuthInitial) {
            return Stack(
              children: [
                ListView(
                  padding: EdgeInsets.symmetric(vertical: 40.h),
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: 25.w, vertical: 10.h),
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
                            errorText: widget.isInvalid? CustomString.invalidValueName : null,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomTextWidget(
                              text: CustomString.email, fontSize: 22),

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
                            errorText: widget.isInvalid? CustomString.invalidValueEmail : null,
                          ),
                          SizedBox(
                            height: 10.h,
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
                            errorText: widget.isInvalid? CustomString.invalidValuePass : null,
                          ),
                          SizedBox(
                            height: 10.h,
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
                            errorText: widget.isInvalid? CustomString.invalidValuePrePass : null,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextWidget(
                            text: CustomString.already,
                            fontSize: 17.sp,
                            color: Colors.grey,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  SignInScreen()));
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
                if (loading) const LoadingPage(),
              ],
            );
          } else if (state is AuthFailureState) {
            return Center(
              child: CustomTextWidget(
                text: state.message,
                fontSize: 18.sp,
              ),
            );
          } else {
            return Center(
                child:
                    CustomTextWidget(text: state.toString(), fontSize: 18.sp));
          }
        },
      ),
    );
  }
}
