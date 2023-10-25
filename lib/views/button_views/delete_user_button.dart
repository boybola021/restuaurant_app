import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';
import 'package:restaurant_app/services/firebase_services/auth_service.dart';

class DeleteUserButton extends StatelessWidget {
  final List login;
  const DeleteUserButton({super.key, required this.login});


  void deleteAccount(context) async {
    final deleteAccount = await AuthService.deleteAccount();
    if (deleteAccount) {
      logInRepository.deleteUser(login.first);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        ),
      );
    } else {
      KTScaffoldMessage.scaffoldMessage(context, CustomString.somethingError);
    }
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
