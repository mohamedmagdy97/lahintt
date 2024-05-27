import 'package:flutter/material.dart';
import 'package:lahint/components/custom_app_bar/custom_app_bar.dart';
import 'package:lahint/screens/home/components/navigation_bar/custom_navigation_bar.dart';
 import 'package:lahint/screens/home/tabs/my_account/components/my_account_item.dart';
import 'package:lahint/utility/all_app_words.dart';

class MyAccountProfile extends StatefulWidget {
  static String routeName = '/MyAccountProfile';

  const MyAccountProfile({super.key});

  @override
  State<MyAccountProfile> createState() => _MyAccountProfileState();
}

class _MyAccountProfileState extends State<MyAccountProfile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(textAppBar: "حسابي الشخصي", showBack: true),
      bottomNavigationBar: const MenuApp(MenuState.myAccount),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          MyAccountItem(
            title: "تغيير رقم الهاتف",
            icon: AppImage.phone_acc,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
