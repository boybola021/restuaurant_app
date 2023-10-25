

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
   static const Icon logout = Icon(Icons.logout);

  /// #BatoomNavigationButtonIcons
  static final Icon home = Icon(CupertinoIcons.home,size: 25.sp,);
  static final  Icon menu = Icon(Icons.menu_book,size: 25.sp,);
  static final  Icon cart = Icon(Icons.shopping_bag_sharp,size: 25.sp,);
  static final Icon personAccount =  Icon(Icons.person, size: 25.sp,);
  static final Icon restaurantAbout = Icon(Icons.restaurant_menu, size: 25.sp);


  /// oder page icon

  static  Icon time = Icon(Icons.access_time_outlined,size: 30.sp,color: CustomColors.pink,);
  static  Icon calendar = Icon(Icons.calendar_month,size: 30.sp,color: CustomColors.pink,);
  static  Icon personOrder = Icon(Icons.person,size: 30.sp,color: CustomColors.pink,);
  static  Icon personAdd = Icon(Icons.person_add_alt_1,size: 30.sp,color: CustomColors.pink,);
  static  Icon phone = Icon(Icons.phone,size: 30.sp,color: CustomColors.pink,);

}