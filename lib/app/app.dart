import 'package:restaurant_app/packages_all.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/base_page.dart';
import 'package:restaurant_app/screens/welcome_pages.dart';
import 'package:restaurant_app/services/firebase_services/auth_service.dart';


class Restaurant extends StatelessWidget {
  const Restaurant({Key? key}) : super(key: key);


  String get pages{
    List<UserSRC> list = logInRepository.readUser();
    String? email = AuthService.user.email;

    if(list.first.email != email){
      return "/welcome_pages.dart";
    }
    return "/base_page.dart";
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
       BlocProvider(create: (context) => cartCubit),
       BlocProvider(create: (context) => allProduct),
       BlocProvider(create: (context) => orderedCubit),
       BlocProvider(create: (context) => authCubit),
     ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          initialRoute: pages,
          routes: {
            "/welcome_pages.dart": (BuildContext context) => const FirstPage(),
            "/base_page.dart": (BuildContext context) => const BasePages(),
        },
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData.dark(useMaterial3: true),
          theme: ThemeData.light(useMaterial3: true),
        ),
      ),
    );
  }
}
