import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';


class DetailPage extends StatelessWidget {
  final MenuModel product;
  const DetailPage({
    super.key,
    required this.product,
  });

  static PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.h),
        child: CustomAppBar(
          text: product.name,
          fontSize: 28.sp,
          height: MediaQuery.sizeOf(context).height,
        ),
      ),
      bottomSheet: StreamBuilder<CartState>(
        initialData: cartCubit.state,
        stream: cartCubit.stream,
        builder: (context, state) {
          return CustomProductButtonDetailPage(product: product,);
        },
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 10),
        children: [
          product.imageUrl.isNotEmpty ?
          SizedBox(
            height: 210.h,
            child:  CachedNetworkImage(
              imageUrl: product.imageUrl,
              placeholder: (context,url) => const ColoredBox(
                color: Colors.transparent,
              ),
              errorWidget: (context,url,error) => const Icon(Icons.error),
            ),
          ):
         const Center(child: CircularProgressIndicator.adaptive(),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// #name
                RichTextDetailPage(name: CustomString.name, desc: product.name),
                SizedBox(
                  height: 10.h,
                ),

                /// #description
                RichTextDetailPage(
                    name: CustomString.desc, desc: product.description),
                SizedBox(
                  height: 10.h,
                ),

                /// #category
                RichTextDetailPage(
                    name: CustomString.category, desc: product.category),
                SizedBox(
                  height: 10.h,
                ),

                /// #price
                RichTextDetailPage(
                    name: CustomString.price, desc: product.price.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
