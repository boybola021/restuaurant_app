

import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/sign_in_pages.dart';
import 'package:restaurant_app/src/service_locator.dart';

class HomePage extends StatelessWidget {
   const HomePage({Key? key}) : super(key: key);
  static final login = logInRepository.readUser().first;

   void logout(BuildContext context) async {
     logInRepository.delateUser(login).then((value) {
       Navigator.of(context).pushReplacement(
         MaterialPageRoute(
           builder: (context) =>  SignInScreen(),
         ),
       );
     });
   }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(onPressed: () => logout(context), icon: const Icon(Icons.logout)),
        ],
      ),
      drawer:  Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).width / 2,
              width: MediaQuery.sizeOf(context).width,
              alignment: Alignment.center,
              color: Colors.blue,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person,size: 50,),
                  ),
                  const SizedBox(height: 10,),
                  Text(login.name,style: const TextStyle(fontSize: 20),),
                ],
              ),
            ),
            Container(
                height: 40,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 20,left: 10,right: 10),
                alignment: Alignment.centerLeft,
                padding:const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurpleAccent),
                ),
                child: Text(login.email, style: Theme.of(context).textTheme.titleLarge)),
            Container(
                height: 40,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 20,left: 10,right: 10),
                alignment: Alignment.centerLeft,
                padding:const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurpleAccent),
                ),
                child: Text(login.password, style: Theme.of(context).textTheme.titleLarge)),
          ],
        ),
      ),
      body: const Center(
        child: Text("Home Page",style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
