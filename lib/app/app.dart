import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/packages_all.dart';
import 'package:flutter/material.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({Key? key}) : super(key: key);

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      debugPrint('Couldn\'t check connectivity status error: $e');
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  String get pages {
    List<UserSRC> list = localRepository.readUser();
    String? email = AuthService.user?.email ?? "";
      if (list.isEmpty) {
        return "/welcome_pages.dart";
      } else {
        return "/base_page.dart";
      }
  }

  @override
  Widget build(BuildContext context) {
    return _connectionStatus.name != "none" ?
     MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => cartCubit),
        BlocProvider(create: (context) => allProduct),
        BlocProvider(create: (context) => orderedCubit),
        BlocProvider(create: (context) => authCubit),
        BlocProvider(create: (context) => localCubit),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          initialRoute: pages,
          routes: {
            "/welcome_pages.dart": (BuildContext context) => const FirstPage(),
            "/base_page.dart": (BuildContext context) =>  const BasePages(),
          },
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData.dark(useMaterial3: true),
          theme: ThemeData.light(useMaterial3: true),
        ),
      ),
    ) : MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData.light(useMaterial3: true),
      home:  Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icons/ofline_gif.gif"),
              CustomTextWidget( text:"Your internet is off",fontSize: 30,fontWeight: FontWeight.w700)
            ],
          ),
        )
      ),
    );
  }
}
