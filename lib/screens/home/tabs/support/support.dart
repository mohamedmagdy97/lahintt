import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/custom_app_bar/custom_app_bar.dart';
import 'package:lahint/components/service_card.dart';
import 'package:lahint/screens/home/components/navigation_bar/custom_navigation_bar.dart';
import 'package:lahint/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';

class SupportScreen extends StatefulWidget {
  static String routeName = '/SupportScreen';

  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => goToWithRemoveRoute(screenNames: ScreenNames.homeScreen),
      child: Scaffold(
        appBar: CustomAppBar(textAppBar: GlobalWords.support_assistance.tr),
        bottomNavigationBar: const MenuApp(MenuState.support),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Divider(),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.yellowLight),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    size: 18,
                    color: AppColors.orange,
                  ),
                  const SizedBox(width: 16),
                  CustomText(
                    text: "برجاء أختيار الخدمة المراد الاستفسار عنها",
                    fontSize: 16,
                    fontFamily: AppFonts.medium,
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            ServiceCard(
              title: "اعداد عقد عمل لوافد",
              description: "خدمة رقم 256428",
              image: AppImage.logo,
              onTap: () {
                goToScreen(
                    screenNames: ScreenNames.chatBotScreen,
                    arguments: "https://lahint.sa/ar/ai-assistant");
              },
            ),
            ServiceCard(
              title: "شطب سجل تجاري مؤسسة فردية",
              description: "خدمة رقم 256428",
              image: AppImage.logo,
              onTap: () {
                goToScreen(
                    screenNames: ScreenNames.chatBotScreen,
                    arguments: "https://lahint.sa/ar/ai-assistant");
              },
            ),

            ///
            /* TapBarHeaderItem(
                tabController: favoriteData.tabController!,
                tabsTitle: [AppWords.sellers.tr, AppWords.products.tr],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: favoriteData.tabController,
                    children: <Widget>[
                      Sellers(favoriteData: favoriteData),
                      Products(favoriteData: favoriteData),
                      // BusinessLeads(businessData: favoriteData),
                    ],
                  ),
                ),
              ),*/
          ],
        ),
      ),
    );
  }
}
