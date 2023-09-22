import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/screens/sign_in_pages.dart';
import 'package:restaurant_app/services/colors.dart';
import 'package:restaurant_app/services/icons.dart';
import 'package:restaurant_app/services/strings.dart';
import 'package:restaurant_app/src/service_locator.dart';
import 'package:restaurant_app/views/custom_app_bar/home_app_bar.dart';
import 'package:restaurant_app/views/home_page_text_fild.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  final login = logInRepository.readUser().first;

  void logout(BuildContext context) async {
    logInRepository.delateUser(login).then(
      (value) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => SignInScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.h),
        child: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.logout),
            ),
          ],
          flexibleSpace: const HomePageAppBar(),
        ),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text(
                "login.name",
                style: TextStyle(fontSize: 20),
              ),
              accountEmail: Text("login.email" ?? "",
                  style: Theme.of(context).textTheme.titleLarge),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: CustomColors.pink,
        unselectedItemColor: Colors.white,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.shifting,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
              icon: CustomIcons.home, label: CustomString.home),
          BottomNavigationBarItem(
              icon: CustomIcons.menu, label: CustomString.menu),
          BottomNavigationBarItem(
              icon: CustomIcons.heart,
              label: CustomString.favourite,
              activeIcon: CustomIcons.heartFill),
          BottomNavigationBarItem(
              icon: CustomIcons.cart, label: CustomString.cart),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// #TextFild
          TextFieldSearch(controller: controller),
          SizedBox(
            height: 150,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 150,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeInCirc,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
              items: [
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.black,
                ),
                Container(
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List list = [
  Container(
    color: Colors.red,
  ),
  Container(
    color: Colors.black,
  ),
  Container(
    color: Colors.yellow,
  ),
];
