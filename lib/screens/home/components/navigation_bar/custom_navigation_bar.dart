import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/utility/all_app_words.dart';

import 'cutom_navigation_item.dart';

enum MenuState { home, myServices, support, myAccount, none }

class MenuApp extends StatelessWidget {
  final MenuState menuStat;
  final Color inactive = const Color(0xFFB6B6B6);

  const MenuApp(this.menuStat, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavigationButton(
            buttonName: AppWords.home.tr,
            buttonImg: AppImage.home,
            buttonSelectedImg: AppImage.home_fill,
            isSelected: MenuState.home == menuStat,
            onTap: () {
              if (Get.currentRoute != ScreenNames.homeScreen) {
                goToScreen(
                    screenNames: ScreenNames.homeScreen, arguments: true);
              }
            },
          ),
          NavigationButton(
            buttonName: GlobalWords.servicee.tr,
            buttonImg: AppImage.services,
            buttonSelectedImg: AppImage.services,
            isSelected: MenuState.myServices == menuStat,
            onTap: () async {
              if (Get.currentRoute != ScreenNames.myServices) {
                goToScreen(
                    screenNames: ScreenNames.myServices, arguments: false);
              }
            },
          ),
          NavigationButton(
            buttonName: GlobalWords.support_assistance.tr,
            buttonImg: AppImage.call_center,
            buttonSelectedImg: AppImage.call_center,
            isSelected: MenuState.support == menuStat,
            onTap: () async {
              if (Get.currentRoute != ScreenNames.favoriteScreen) {
                goToScreen(
                  screenNames: ScreenNames.favoriteScreen,
                );
              }
            },
          ),
          NavigationButton(
            buttonName: AppWords.profile.tr,
            buttonImg: AppImage.my_account,
            buttonSelectedImg: AppImage.my_account,
            isSelected: MenuState.myAccount == menuStat,
            onTap: () async {
              if (Get.currentRoute != ScreenNames.myAccount) {
                goToScreen(
                  screenNames: ScreenNames.myAccount,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
