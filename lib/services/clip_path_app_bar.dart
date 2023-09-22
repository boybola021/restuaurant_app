



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    var path = Path();
    path.lineTo(0, size.height); //start point

    var firstStart = Offset(
        size.width / 5, size.height); //fist point of quadratic bezier curve

    var firstEnd = Offset(size.width / 2.45,
        size.height - 30.0.h); //second point of quadratic bezier curve)

    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
    Offset(size.width - (size.width / 3.24), size.height - 80.h);

    //third point of quadratic bezier curve

    var secondEnd = Offset(size.width, size.height);

    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
//fourth point of quadratic bezier curve
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
