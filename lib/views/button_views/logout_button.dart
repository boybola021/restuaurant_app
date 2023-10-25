
import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';
import 'package:restaurant_app/services/firebase_services/auth_service.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  void logout(context) async {
    final signOut = await AuthService.signOut();
    if (signOut) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
      );
    } else {
      KTScaffoldMessage.scaffoldMessage(context, CustomString.somethingError);
    }
  }
  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 40.h,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        //border: Border.all(color: Colors.grey),
      ),
      child: IconButton(
        onPressed: () => logout(context),
        icon: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Log out",
              style: TextStyle(fontSize: 20),
            ),
            CustomIcons.logout
          ],
        ),
      ),
    );
  }
}
