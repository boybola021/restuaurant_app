
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/screens/home_page.dart';
import 'package:restaurant_app/screens/sign_in_pages.dart';
import 'package:restaurant_app/src/service_locator.dart';

import '../screens/welcome_pages.dart';
import '../src/user_login_model.dart';

class Restaurant extends StatelessWidget {
  const Restaurant({Key? key}) : super(key: key);

  Widget get page{
    List<User>login = logInRepository.readUser();
    log("====>$login=====");
   // login.first.email == "sharipovohon@gmail.com" && login.first.password == "1234oxun".isNotEmpty? logInRepository.readUser() : [User(id: 1, name: "name", email: "email", password: "password")];
    if(login.isNotEmpty){
      return const HomePage();
    }else{
      return  SignInScreen();
    }
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData.light(useMaterial3: true),
      home: Builder(
        builder: (context) {
          ScreenUtil.init(context);
          return const HomePage();
        }
      ),
    );
  }
}
