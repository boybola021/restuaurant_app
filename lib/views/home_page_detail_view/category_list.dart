import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';

class CustomCategoryList extends StatefulWidget {
  const CustomCategoryList({super.key});

  @override
  State<CustomCategoryList> createState() => _CustomCategoryListState();
}

class _CustomCategoryListState extends State<CustomCategoryList> {
  int onTapIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 50.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 15.w, top: 5.h),
          itemCount: 10,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                onTapIndex = i;
                setState(() {});
              },
              child: Container(
                height: 40.h,
                width: 100.w,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(
                    horizontal: 3, vertical: 5),
                decoration: BoxDecoration(
                  color: onTapIndex == i
                      ? CustomColors.pink
                      : Colors.blueGrey,
                  borderRadius:
                  const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text("Item ${i + 1}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
