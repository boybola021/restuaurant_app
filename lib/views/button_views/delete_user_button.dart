import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';

class DeleteUserButton extends StatelessWidget {
  const DeleteUserButton({super.key,});

  Future<void>deleteAccount(context)async{
    return showDialog(
        context: context,
        builder: (BuildContext context){
          if(Platform.isAndroid){
            /// addroid uchun
            return AlertDialog(
              title: const Text("Attention"),
              content: const Text("Do you really want to delete account"),
              actions: [
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text("No"),
                ),
                TextButton(
                  onPressed: ()async{
                    final deleteAccount = await AuthService.deleteAccount();
                    if (deleteAccount) {
                      localRepository.deleteUser();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) =>  SignUpScreen(),
                          ),
                              (route) => false);
                    } else {
                      KTScaffoldMessage.scaffoldMessage(context, CustomString.somethingError);
                    }
                  },
                  child: const Text("Yes"),
                ),
              ],
            );
          }else {
            /// iPone uchuun dialog
            return CupertinoAlertDialog(
              title: const Text("Attention"),
              content: const Text("Do you really want to delete account"),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No"),
                ),
                CupertinoDialogAction(
                  onPressed: ()async{
                    final deleteAccount = await AuthService.deleteAccount();
                    if (deleteAccount) {
                      localRepository.deleteUser();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) =>  SignInScreen(),
                          ),
                              (route) => false);
                    } else {
                      KTScaffoldMessage.scaffoldMessage(context, CustomString.somethingError);
                    }
                  },
                  child: const Text("Yes"),
                ),
              ],
            );
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 40.h,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        //border: Border.all(color: Colors.grey),
      ),
      child: IconButton(
        onPressed: () => deleteAccount(context),
        icon: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delete account",
              style: TextStyle(fontSize: 20),
            ),
            Icon(
              Icons.logout,
            ),
          ],
        ),
      ),
    );
  }
}
