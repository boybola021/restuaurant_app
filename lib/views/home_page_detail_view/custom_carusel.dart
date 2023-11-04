import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';

class CustomCarouselSlider extends StatelessWidget {
  final List<MenuModel> products;

  const CustomCarouselSlider({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty ?SizedBox(
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
          products.length,
          (index) => Card(
            clipBehavior: Clip.antiAlias,
            elevation: 20,
            color: Colors.white,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: products[index].imageUrl.isNotEmpty
                  ?  CachedNetworkImage(
                imageUrl:products[index].imageUrl ,
                placeholder: (context,url) => const ColoredBox(
                  color: Colors.transparent,
                ),
                errorWidget: (context,url,error) => const Icon(Icons.error),
              ) : const CircularProgressIndicator.adaptive(),
            ),
          ),
        ),
      ),
    ) :  Center(child: Text("This product does not\nhave a picture",textAlign: TextAlign.center,style: TextStyle(fontSize: 25.sp),),);
  }
}
