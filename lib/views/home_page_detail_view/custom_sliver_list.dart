import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';


class CustomSliverList extends StatelessWidget {

  final MenuModel data;

  const CustomSliverList({super.key, required this.data,});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.symmetric(
          horizontal: 15, vertical: 5),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                product: data,
              ),),);
        },
        leading:
        Container(
          height: 90.h,
          width: 80.w,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12.r),
            ),
          ),
          child: Image.network(
            data.imageUrl,
            fit: BoxFit.fill,
            errorBuilder: (context, child,
                StackTrace? stackTress) {
              return const Icon(Icons.error);
            },
          ),
        ),
        title: Text(data.name,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600),),
        subtitle: Text("${data.price} \$",style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.w600),),
      ),
    );
  }
}
