import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';

class CustomCarouselSlider extends StatelessWidget {
  final List<MenuModel> products;

  const CustomCarouselSlider({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 170.h,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          clipBehavior: Clip.antiAlias,
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
        items: List.generate(
          3,
          (index) => Card(
            clipBehavior: Clip.antiAlias,
            elevation: 20,
            color: Colors.white,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: products[index].imageUrl.isNotEmpty
                  ? Image.network(
                      products[index].imageUrl.first,
                    )
                  : const CircularProgressIndicator.adaptive(),
            ),
          ),
        ),
      ),
    );
  }
}
