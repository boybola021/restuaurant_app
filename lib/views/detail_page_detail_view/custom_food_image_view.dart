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
              child: Image.network(product.imageUrl[i],fit: BoxFit.contain,),
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
