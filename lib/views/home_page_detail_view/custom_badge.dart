
import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';

class CustomBadgeView extends StatelessWidget {
  const CustomBadgeView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Badge(
      alignment: const Alignment(0.9, -0.9),
      label: BlocBuilder<CartController,CartState>(
          bloc: cartCubit,
          builder: (context, state) {
            final cartCount = state.item.length;
            return Text(
                "${cartCount == 0 ? "0" : cartCount < 9 ? cartCount : "9+"}");
          }),
      backgroundColor: Colors.red,
      child: Container(
        height: 30.h,
        width: 30.w,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: CustomColors.pink,
        ),
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ShopPage(),),);
          },
          icon: const Icon(
            Icons.shopping_cart_rounded,
            size: 20,
          ),
        ),
      ),
    );
  }
}
