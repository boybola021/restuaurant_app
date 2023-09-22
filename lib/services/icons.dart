

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

sealed class CustomIcons{

  static const Icon person =  Icon(Icons.person, size: 30,);
  static const Icon email =  Icon(Icons.email_outlined, size: 30,);
  static const Icon lock =   Icon(CupertinoIcons.lock, size: 30,);
  static const Icon facebook =  Icon(Icons.facebook, color: Colors.lightBlue, size: 35,);
  static const Icon restaurant = Icon(
    Icons.restaurant_menu,
    color: CustomColors.orange,
    size: 50,
  );

   static const Icon searchIcon = Icon(CupertinoIcons.search);

  /// #BatoomNavigationButtonIcons
  static const Icon home = Icon(CupertinoIcons.home);
  static const Icon menu = Icon(Icons.menu_book);
  static const Icon heart = Icon(CupertinoIcons.heart);
  static const Icon heartFill = Icon(CupertinoIcons.heart_fill);
  static const Icon cart = Icon(Icons.shopping_bag_sharp);
}