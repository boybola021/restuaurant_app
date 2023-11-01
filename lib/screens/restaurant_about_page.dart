import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';
import 'package:lottie/lottie.dart' hide LottieComposition;


class RestaurantAboutPage extends StatefulWidget {
  const RestaurantAboutPage({super.key});

  @override
  State<RestaurantAboutPage> createState() => _RestaurantAboutPageState();
}

class _RestaurantAboutPageState extends State<RestaurantAboutPage> {
  Future<void>? _launched;


  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.h),
        child: CustomAppBar(
          text: "Contact US",
          fontSize: 25,
          height: MediaQuery.sizeOf(context).height,
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
              child: Lottie.asset("assets/lottie/Animation - 1698229379599.json"),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomIcons.location,
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: () => setState(() {
                    _launched = _launchInBrowser(
                      Uri.parse(CustomString.mapUrl),
                    );
                  }),
                  child: CustomTextWidget(
                    text: CustomString.location,
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h,),
          /// #time
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomIcons.watch,
                 SizedBox(
                  width: 20.w,
                ),
                CustomTextWidget(
                  text: CustomString.allDaysOfWeek,
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h,),
          /// #call center
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomIcons.phoneNumber,
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: () {
                    _makePhoneCall(CustomString.phoneNumber);
                    setState(() {});
                  },
                  child: CustomTextWidget(
                    text: CustomString.phoneNumber,
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h,),
          /// #socila medial
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// #facebook
             SocialMediaButton(
                 onPressed: () => setState(() {
                   _launched = _launchInBrowser(
                     Uri.parse(CustomString.facebookUrl),
                   );
                 }),
                 icon:CustomIcons.facebook,
             ),

              SizedBox(width: 20.w,),
              /// #instagram
              SocialMediaButton(
                onPressed: () => setState(() {
                  _launched = _launchInBrowser(
                    Uri.parse(CustomString.instagramUrl),
                  );
                }),
                icon:CustomIcons.instagram,
              ),
              SizedBox(width: 20.w,),
              /// #telegram
              SocialMediaButton(
                onPressed: () => setState(() {
                  _launched = _launchInBrowser(
                    Uri.parse(CustomString.telegramUrl),
                  );
                }),
                icon:CustomIcons.telegram,
              ),
            ],
          ),
          FutureBuilder<void>(future: _launched, builder: _launchStatus),
        ],
      ),
    );
  }
}
