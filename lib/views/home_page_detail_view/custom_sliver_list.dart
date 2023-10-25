import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';

class CustomSliverList extends StatefulWidget {
  final MenuModel data;
  const CustomSliverList({super.key, required this.data});

  @override
  State<CustomSliverList> createState() => _CustomSliverListState();
}

class _CustomSliverListState extends State<CustomSliverList> {
  bool like = false;
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
                product: widget.data,
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
            widget.data.imageUrl.first,
            fit: BoxFit.fill,
            errorBuilder: (context, child,
                StackTrace? stackTress) {
              return const Icon(Icons.error);
            },
          ),
        ),
        title: Text(widget.data.name),
        subtitle: Text("${widget.data.price} \$"),
      ),
    );
  }
}
