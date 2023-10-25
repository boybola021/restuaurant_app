
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';
import 'package:restaurant_app/services/firebase_services/auth_service.dart';

import 'firebase_options.dart';

final cartCubit = CartController();
final allProduct = AllProductsCubit();
final orderedCubit = OrderCubit();
final authCubit = AuthCubit();

void main()async{

  WidgetsFlutterBinding.ensureInitialized();

  /// #local control
  await serviceLocatorLocal();

  /// #responsive package
  await ScreenUtil.ensureScreenSize();

  /// #firebase

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Restaurant());

}