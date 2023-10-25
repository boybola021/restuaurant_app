import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';

class CustomProductButtonDetailPage extends StatelessWidget {
  final MenuModel product;
  const CustomProductButtonDetailPage({super.key, required this.product,});
  static int count = 0;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 60.h,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IncrDeceButton(
                onPressed: () {
                  cartCubit.addToCard(product: product, quantity: -1);
                  if(count > 0){
                    count--;
                  }
                },
                icon: const Icon(
                  Icons.remove,
                  size: 20,
                ),
              ),
              Text(
                count.toString(),
                style: const TextStyle(fontSize: 25),
              ),
              IncrDeceButton(
                onPressed: () {
                  count++;
                  cartCubit.addToCard(product: product, quantity: 1);
                },
                icon: const Icon(
                  Icons.add,
                  size: 20,
                ),
              )
            ],
          ),
          AddToCartButton(pressed: () {
            if (count > 0) {
              Navigator.pop(context);
              count = 0;
            }
          }),
        ],
      ),
    );
  }
}
