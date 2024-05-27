import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lahint/components/custom_app_bar/custom_app_bar.dart';
import 'package:lahint/components/tap_bar_header_item.dart';
import 'package:lahint/screens/home/components/navigation_bar/custom_navigation_bar.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/screens/home/tabs/my_services/components/canceled_service.dart';
import 'package:lahint/screens/home/tabs/my_services/components/current_service.dart';
import 'package:lahint/screens/home/tabs/my_services/components/done_service.dart';
import 'package:lahint/utility/all_app_words.dart';

class MyServices extends StatefulWidget {
  static String routeName = '/OrdersScreen';

  const MyServices({super.key});

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => goToWithRemoveRoute(screenNames: ScreenNames.homeScreen),
      child: Scaffold(
        appBar: CustomAppBar(textAppBar: GlobalWords.servicee.tr),
        bottomNavigationBar: const MenuApp(MenuState.myServices),
        body: Column(
          children: [
            TapBarHeaderItem(
              tabController: tabController!,
              tabsTitle: const ["جاري تنفيذها", "تم تنفيذه", "ملغي"],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: const <Widget>[
                    CurrentService(),
                    DoneService(),
                    CanceledService(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
