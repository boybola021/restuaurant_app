

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/services/clip_path_app_bar.dart';

import '../../services/colors.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        child: SizedBox(
          child: Stack(
            children: [
              SizedBox(
                child: ClipPath(
                  clipper: BannerClipper(),
                  child: Container(
                    height: 200.h,
                  ),
                ),
              ),
              ClipPath(
                clipper: BannerClipper(),
                child: Container(
                  color: CustomColors.pink,
                  height: 180.h,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 40.w),
                    child: Text(
                      "Menu",
                      style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: 1.5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
