
import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';


class ShopPage extends StatelessWidget {
  const ShopPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.h),
        child: CustomAppBar(
          text: "Cart Page",
          fontSize: 25,
          height: MediaQuery.sizeOf(context).height,
        ),
      ),
      body: BlocBuilder<CartController, CartState>(
        bloc: cartCubit,
        builder: (context, state) {
          if (state.item.isNotEmpty) {
            return ListView(
              padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
              children: [
                CustomShopPageProducts(item: state.item,),
                SizedBox(height: 50.h,),
                ElevatedButton(
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
                SizedBox(height: 20.h),
              ],
            );
          }
          else {
            return  Container(
              alignment: Alignment.center,
              color: const Color.fromRGBO(13,12,15, 1),
              child: Image.asset("assets/images/dribble_cart.gif",fit: BoxFit.cover,),
            );
          }
        },
      ),
    );
  }
}