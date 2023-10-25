import 'package:flutter/material.dart';
import 'package:restaurant_app/packages_all.dart';
import 'package:restaurant_app/views/button_views/delete_user_button.dart';
import 'package:restaurant_app/views/button_views/logout_button.dart';
import 'loading_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  CarouselController carouselController = CarouselController();
  List<UserSRC> login = [];

  @override
  void initState() {
    super.initState();
    login = logInRepository.readUser();
    context.read<AllProductsCubit>().allData();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
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
                login.first.name ?? "",
                style: const TextStyle(fontSize: 20),
              ),
              accountEmail: Text(login.first.email ?? "",
                  style: Theme.of(context).textTheme.titleLarge),
            ),

            /// #log out
           const LogOutButton(),
            /// #delate account
            DeleteUserButton(login: login,),
          ],
        ),
      ),
      body: BlocBuilder<AllProductsCubit, AllProductsState>(
        builder: (context, state) {
          if (state is AllProductsInitial) {
            return const LoadingPage();
          }
          if (state is GetAllProducts && state.products.isNotEmpty) {
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
                const SliverToBoxAdapter(
                  child: CustomCategoryList(),
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
                "Check Network",
                style: TextStyle(fontSize: 30),
              ),
            );
          }
        },
      ),
    );
  }
}
