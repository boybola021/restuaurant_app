
import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/src/service_locator.dart';

import 'app/app.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocatorLocal();
  runApp(const Restaurant());
}

/// Todo: language
/// Todo: Admin page