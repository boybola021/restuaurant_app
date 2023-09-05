

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

abstract class CustomIcons{

  static const Icon person =  Icon(Icons.person, size: 30,);
  static const Icon email =  Icon(Icons.email_outlined, size: 30,);
  static const Icon lock =   Icon(CupertinoIcons.lock, size: 30,);
  static const Icon facebook =  Icon(Icons.facebook, color: Colors.lightBlue, size: 35,);
  static const Icon restaurant = Icon(
    Icons.restaurant_menu,
    color: CustomColors.orange,
    size: 50,
  );
}