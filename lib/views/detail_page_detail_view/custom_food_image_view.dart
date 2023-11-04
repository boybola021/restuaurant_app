import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomFoodImagesView extends StatelessWidget {
  final MenuModel product;
  final PageController controller;
  const CustomFoodImagesView({super.key, required this.product,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          controller: controller,
          itemCount: product.imageUrl.length,
          allowImplicitScrolling: true,
          reverse: true,
          itemBuilder: (context,i){
            return Card(
              elevation: 10,
              child:  CachedNetworkImage(
                imageUrl: product.imageUrl,
                placeholder: (context,url) => const ColoredBox(
                  color: Colors.transparent,
                ),
                errorWidget: (context,url,error) => const Icon(Icons.error),
              ),
            );
          },
        ),
        SmoothPageIndicator(
          controller: controller,
          count: product.imageUrl.length,
          effect:
           const WormEffect(
            dotHeight: 12,
            dotWidth: 12,
            activeDotColor: CustomColors.pink,
            type: WormType.thinUnderground,
          ),
        ),
      ],
    );
  }
}
