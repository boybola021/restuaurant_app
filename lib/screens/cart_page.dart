
import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';


class ShopPage extends StatelessWidget {
  const ShopPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Ordered",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: BlocBuilder<CartController, CartState>(
        bloc: cartCubit,
        builder: (context, state) {
          if(state.total == state.total){}
          if (state.item.isNotEmpty) {
            return Column(
              children: [
                CustomShopPageProducts(item: state.item,),
                Text("${state.total}",style: const TextStyle(fontSize: 23),),
                const Spacer(),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  OrderedPage(items: [...state.item],)));
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        MediaQuery.sizeOf(context).width,
                      45.h),
                      backgroundColor: CustomColors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      alignment: Alignment.center,
                    ),
                    child:  Text("Next",style: TextStyle(color: Colors.white,fontSize:17.sp),),
                  ),
                ),
              ],
            );
          }
          else {
            return const Center(
              child: Text(
                "Cart empty",
                style: TextStyle(fontSize: 30),
              ),
            );
          }
        },
      ),
    );
  }
}