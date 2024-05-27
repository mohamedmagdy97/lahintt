import 'package:flutter/material.dart';
import 'package:lahint/components/custom_app_bar/custom_app_bar.dart';
 import 'package:lahint/screens/home/components/navigation_bar/custom_navigation_bar.dart';
import 'package:lahint/screens/home/tabs/my_account/components/my_account_item.dart';
import 'package:lahint/utility/all_app_words.dart';

class HelpScreen extends StatefulWidget {
  static String routeName = '/HelpScreen';

  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(textAppBar: "المساعدة", showBack: true),
      bottomNavigationBar: const MenuApp(MenuState.myAccount),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          MyAccountItem(
            title: "شركة لاهنت لخدمات الأعمال",
            icon: AppImage.logo,
            onTap: () {},
            removeBorder: true,
          ),
          MyAccountItem(
            title: "+966 594719988",
            icon: AppImage.phone_acc,
            onTap: () {},
            removeBorder: true,
          ),
          MyAccountItem(
            title: "Info@lahint.sa",
            icon: AppImage.mail_acc,
            onTap: () {},
            removeBorder: true,
          ),
          MyAccountItem(
            title: "الدمام , السعودية",
            icon: AppImage.location_acc,
            onTap: () {},
            removeBorder: true,
          ),
        ],
      ),
    );
  }
}
