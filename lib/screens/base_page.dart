

import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';

class BasePages extends StatefulWidget {
  const BasePages({super.key});

  @override
  State<BasePages> createState() => _BasePagesState();
}

class _BasePagesState extends State<BasePages> {
  int currentIndex = 0;
  late PageController controller;
  List<Widget> pages = const [
    HomePage(),
    ShopPage(),
    UserPage(),
    MapPage(),
  ];
  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentIndex);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: CustomColors.pink,
        unselectedItemColor: Colors.white,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          currentIndex = value;
          controller.jumpToPage(currentIndex);
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: CustomIcons.home, label: CustomString.home),
          BottomNavigationBarItem(
              icon: CustomIcons.cart, label: CustomString.cart),
          BottomNavigationBarItem(
              icon: CustomIcons.personAccount,
              label: CustomString.person),
          BottomNavigationBarItem(
              icon: CustomIcons.restaurantAbout, label: CustomString.about),
        ],
      ),
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(pages.length, (index) => pages[index]),
      ),
    );
  }
}

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
