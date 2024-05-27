import 'package:flutter/material.dart';
import 'package:lahint/components/custom_app_bar/custom_app_bar.dart';
import 'package:lahint/screens/home/components/navigation_bar/custom_navigation_bar.dart';
import 'package:lahint/screens/home/tabs/my_account/components/my_account_item.dart';
import 'package:lahint/screens/language/language_date.dart';
import 'package:lahint/utility/all_app_words.dart';

class LanguageScreen extends StatefulWidget {
  static String routeName = '/LanguageScreen';

  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  LanguageData languageData = LanguageData();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(textAppBar: "تغيير اللغة", showBack: true),
      bottomNavigationBar: const MenuApp(MenuState.myAccount),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          MyAccountItem(
            title: "English",
            icon: AppImage.en_acc,
            onTap: () => languageData.changeLang(lang: "en"),
          ),
          MyAccountItem(
            title: "العربية",
            icon: AppImage.ar_acc,
            onTap: () => languageData.changeLang(lang: "ar"),
          ),
        ],
      ),
    );
  }
}
