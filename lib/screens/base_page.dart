import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';
import 'history_page.dart';

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
    RestaurantAboutPage(),
    GoogleMapPage(),
    HistoryOrderProductPage(),
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
          const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: CustomString.cart),
          BottomNavigationBarItem(
              icon: CustomIcons.restaurantAbout,
              label: CustomString.about),
          BottomNavigationBarItem(
              icon: CustomIcons.mapIcon, label: CustomString.map),
           BottomNavigationBarItem(
              icon: CustomIcons.cart, label: CustomString.history),
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

