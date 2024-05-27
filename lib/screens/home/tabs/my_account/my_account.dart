import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lahint/components/custom_app_bar/custom_app_bar.dart';
import 'package:lahint/screens/home/components/navigation_bar/custom_navigation_bar.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/screens/home/tabs/home/home_data.dart';
import 'package:lahint/screens/home/tabs/my_account/components/my_account_item.dart';
import 'package:lahint/utility/all_app_words.dart';

class MyAccount extends StatefulWidget {
  static String routeName = '/MyAccount';

  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => goToWithRemoveRoute(screenNames: ScreenNames.homeScreen),
      child: Scaffold(
        appBar: CustomAppBar(textAppBar: AppWords.profile.tr),
        bottomNavigationBar: const MenuApp(MenuState.myAccount),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            MyAccountItem(
              title: "حسابي الشخصي",
              icon: AppImage.profile_acc,
              onTap: () =>
                  goToScreen(screenNames: ScreenNames.myAccountProfile),
            ),
            MyAccountItem(
              title: "الأعدادات",
              icon: AppImage.setting_acc,
              onTap: () => goToScreen(screenNames: ScreenNames.setting),
            ),
            MyAccountItem(
              title: GlobalWords.privacy_policy.tr,
              icon: AppImage.privacy_acc,
              onTap: () => goToScreen(screenNames: ScreenNames.privacyScreen),
            ),
            MyAccountItem(
              title: AppWords.logout.tr,
              icon: AppImage.logout_acc,
              onTap: () => homeData.logOutUser(),
            ),
          ],
        ),
      ),
    );
  }
}
