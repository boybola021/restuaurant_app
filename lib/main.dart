
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/src/service_locator.dart';
import 'app/app.dart';

void main()async{

  WidgetsFlutterBinding.ensureInitialized();

  /// #network control
  await serviceLocatorLocal();

  /// #responsive package
  await ScreenUtil.ensureScreenSize();

  runApp(const Restaurant());
}

/// Todo: language
/// Todo: Admin page