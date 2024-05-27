import 'package:flutter/material.dart';
import 'package:lahint/components/custom_app_bar/custom_app_bar.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/screens/home/components/navigation_bar/custom_navigation_bar.dart';
import 'package:lahint/screens/home/tabs/my_account/components/my_account_item.dart';
import 'package:lahint/utility/all_app_words.dart';

class Setting extends StatefulWidget {
  static String routeName = '/Setting';

  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(textAppBar: "الأعدادات", showBack: true),
      bottomNavigationBar: const MenuApp(MenuState.myAccount),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          MyAccountItem(
            title: "تغيير اللغة",
            icon: AppImage.lang_acc,
            onTap: () => goToScreen(screenNames: ScreenNames.languageScreen),
          ),
          MyAccountItem(
            title: "المساعدة",
            icon: AppImage.setting_acc,
            onTap: () => goToScreen(screenNames: ScreenNames.helpScreen),
          ),
        ],
      ),
    );
  }
}
