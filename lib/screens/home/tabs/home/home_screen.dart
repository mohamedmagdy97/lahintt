import 'package:flutter/material.dart';
import 'package:lahint/screens/home/components/navigation_bar/custom_navigation_bar.dart';
import 'package:lahint/components/screen.dart';
import 'package:lahint/screens/home/tabs/home/components/search_widget.dart';
import 'package:lahint/screens/home/tabs/home/components/categories_widget.dart';
import 'package:lahint/screens/home/tabs/home/components/slider_widget.dart';

import 'home_data.dart';

class HomeScreen extends StatefulWidget {
  static String route = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    homeData.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      loading: homeData.loading,
      child: Scaffold(
        bottomNavigationBar: const MenuApp(MenuState.home),
        body: /*RefreshIndicator(
            color: AppColors.secondaryColor,
            backgroundColor: AppColors.white,
            onRefresh: () async {
              if (!BlocProvider.of<UserCubit>(Get.context!, listen: false)
                  .iSUserVisitor) {
                BlocProvider.of<UserCubit>(Get.context!, listen: false)
                    .getWallet();
              }
            },
            child:*/
            ListView(
          children: const [
            /// search
            SearchWidget(),
            SizedBox(height: 16),

            ServicesWidget(),
            SizedBox(height: 16),

            SliderWidget(),
          ],
        ),
        // ),
      ),
    );
  }
}
