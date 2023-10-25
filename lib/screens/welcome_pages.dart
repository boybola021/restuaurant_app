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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextWidget(
                    text: "C R A",
                    fontWeight: FontWeight.w600,
                    fontSize: 50.sp),
                CustomIcons.restaurant,
                CustomTextWidget(
                  text: "E",
                  fontWeight: FontWeight.w600,
                  fontSize: 50.sp,
                ),
              ],
            ),
            SizedBox(
              height: 35.h,
            ),
            CustomTextWidget(
              text: CustomString.firstText,
              positionText: TextAlign.center,
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
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
    final x = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [SkipButton()],
                  ),
                  SizedBox(
                    height: y / 20,
                  ),
                  CustomTextWidget(
                    text: CustomString.selectionFoodsText,
                    positionText: TextAlign.center,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
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
                  CustomTextWidget(
                      text: CustomString.ourRestaurant,
                      positionText: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      fontSize: 22.sp),
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
          ),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [SkipButton()],
              ),
              SizedBox(
                height: y / 20,
              ),
              CustomTextWidget(
                  text: CustomString.seatSelection,
                  positionText: TextAlign.center,
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
              const Spacer(),
              Center(
                child: Container(
                  height: y / 2.5,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: CustomImages.seatImg2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              CustomTextWidget(
                text: CustomString.appUseSelectRestaurant,
                positionText: TextAlign.center,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
              SizedBox(
                height: y / 30,
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
              const Spacer(),
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
    final x = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [SkipButton()],
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextWidget(
                  text: CustomString.homeDelivery,
                  positionText: TextAlign.center,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
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
                        image: CustomImages.deliveryImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                CustomTextWidget(
                  text: CustomString.contactFree,
                  positionText: TextAlign.center,
                  fontSize: 30,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                  },
                  text: CustomString.next,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
