import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  Future<void> logout(context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          if (Platform.isAndroid) {
            /// addroid uchun
            return AlertDialog(
              title: const Text("Attention"),
              content: const Text("Do you really want to sign out"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No"),
                ),
                TextButton(
                  onPressed: () async {
                    final signOut = await AuthService.signOut();
                    if (signOut) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) =>  SignInScreen(),
                          ),
                          (route) => false);
                    } else {
                      KTScaffoldMessage.scaffoldMessage(
                          context, CustomString.somethingError);
                    }
                  },
                  child: const Text("Yes"),
                ),
              ],
            );
          } else {
            /// iPone uchuun dialog
            return CupertinoAlertDialog(
              title: const Text("Attention"),
              content: const Text("Do you really want to sign out"),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No"),
                ),
                CupertinoDialogAction(
                  onPressed: () async {
                    final signOut = await AuthService.signOut();
                    if (signOut) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) =>  SignInScreen(),
                          ),
                              (route) => false);
                    } else {
                      KTScaffoldMessage.scaffoldMessage(
                          context, CustomString.somethingError);
                    }
                  },
                  child: const Text("Yes"),
                ),
              ],
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
