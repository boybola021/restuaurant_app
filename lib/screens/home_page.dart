import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';
import 'loading_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController carouselController = CarouselController();
  List<UserSRC> login = [];
  int onTapIndex = 0;
  String result = "Foods";
  @override
  void initState() {
    super.initState();
    login = localRepository.readUser();
    context.read<AllProductsCubit>().allData(category: result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: const [
          CustomBadgeView(),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                login.first.name,
                style:  TextStyle(fontSize: 20.sp,color: Colors.white),
              ),
              accountEmail: Text( login.first.email,
                  style: TextStyle(fontSize: 20.sp,color: Colors.white)),
            ),
            /// #log out
           const LogOutButton(),
            /// #delate account
            const DeleteUserButton(),
          ],
        ),
      ),
      body: BlocBuilder<AllProductsCubit, AllProductsState>(
        builder: (context, state) {
          debugPrint(state.runtimeType.toString());
          if (state is AllProductsInitial || state is AllProductsLoading) {
            return const LoadingPage();
          }
          if (state is GetAllProducts) {
            return CustomScrollView(
              slivers: [
                /// #Sliver appBar Carusel
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 170.h,
                  /// #CaruselSliver
                  flexibleSpace: CustomCarouselSlider(
                    products: state.products,
                  ),
                ),
                /// #Category
                 SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                      height: 50.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 15.w, top: 5.h),
                        itemCount: CategoryEnum.values.length,
                        itemBuilder: (context, i) {
                          final data = CategoryEnum.values[i].category;
                          return GestureDetector(
                            onTap: () {
                              onTapIndex = i;
                              result = CategoryEnum.values[i].category;
                              context.read<AllProductsCubit>().allData(category: result);
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
                              child: CustomTextWidget(text: data,fontWeight: FontWeight.w700,fontSize: 18.sp),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                /// #SliverChildBuilderDelegate
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.products.length,
                    (context, index) {
                      final data = state.products[index];
                      return CustomSliverList(data: data);
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text(
                "No Data",
                style: TextStyle(fontSize: 30),
              ),
            );
          }
        },
      ),
    );
  }
}
