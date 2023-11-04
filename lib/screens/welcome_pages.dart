import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    goToNextPage();
  }

  void goToNextPage() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const MainPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: CustomImages.backgroundImg,
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Image.asset("assets/icons/istanbul-restaurant-logo_1.png",color: Colors.white,),
      ),
    );
  }
}


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const List<Widget> pages = [

    /// #page two
    TwoPage(),

    /// #page three
    ThreePage(),

    /// #page four
    FourPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: CubePageView.builder(
            itemCount: pages.length,
            itemBuilder: (context, index, notifier) {
              final item = pages[index];
              final transform = Matrix4.identity();
              final t = (index - notifier).abs();
              final scale = lerpDouble(1.5, 0, t);
              transform.scale(scale, scale);
              return CubeWidget(
                index: index,
                pageNotifier: notifier,
                child: item,
              );
            },
          ),
        ),
      ),
    );
  }
}



class TwoPage extends StatelessWidget {
  const TwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final y = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: const [
          SkipButton(),
          SizedBox(width: 10,),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextWidget(
                text: CustomString.selectionFoodsText,
                positionText: TextAlign.center,
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Center(
              child: Container(
                height: 250.h,
                width: 250.w,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: CustomImages.foodImg2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomTextWidget(
                  text: CustomString.ourRestaurant,
                  positionText: TextAlign.center,
                  fontWeight: FontWeight.w500,
                  fontSize: 25.sp),
            ),
            SizedBox(
              height: y / 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomBox(
                  width: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                CustomBox(
                  width: 10,
                  color: CustomColors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                CustomBox(
                  width: 10,
                  color: CustomColors.grey,
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}



class ThreePage extends StatelessWidget {
  const ThreePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final y = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: const [
          SkipButton(),
          SizedBox(width: 10,),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            children: [
              SizedBox(height: 20.h,),
              CustomTextWidget(
                  text: CustomString.seatSelection,
                  positionText: TextAlign.center,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600),
              SizedBox(height: 30.h,),
              Center(
                child: Container(
                  height: y / 2.3.h,
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.symmetric(vertical: 20.h),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: CustomImages.seatImg2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.h,),
              CustomTextWidget(
                text: CustomString.appUseSelectRestaurant,
                positionText: TextAlign.center,
                fontWeight: FontWeight.w500,
                fontSize: 25.sp,
              ),
              SizedBox(height: 20.h,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomBox(
                    width: 10,
                    color: CustomColors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CustomBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CustomBox(
                    width: 10,
                    color: CustomColors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FourPage extends StatelessWidget {
  const FourPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final y = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          children: [
            SizedBox(height: y / 10,),
            CustomTextWidget(
              text: CustomString.homeDelivery,
              positionText: TextAlign.center,
              fontSize: 28.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: y / 15,),
            Center(
              child: Container(
                height: 250.h,
                width: 250.w,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: CustomImages.deliveryImg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: y / 15,),
            CustomTextWidget(
              text: CustomString.contactFree,
              positionText: TextAlign.center,
              fontSize: 25.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 20.h,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomBox(
                  width: 10,
                  color: CustomColors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                CustomBox(
                  width: 10,
                  color: CustomColors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                CustomBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: y / 25,
            ),
            CustomButton(
              page: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  SignInScreen()), (route) => false);
              },
              text: CustomString.next,
            ),
            SizedBox(height: y / 20),
          ],
        ),
      ),
    );
  }
}
