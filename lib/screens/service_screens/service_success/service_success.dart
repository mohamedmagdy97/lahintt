import 'package:flutter/material.dart';
import 'package:lahint/components/button/button.dart';
import 'package:lahint/components/custom_app_bar/custom_app_bar.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/utility/app_theme.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/utility/all_app_words.dart';

class ServiceSuccessScreen extends StatefulWidget {
  static String routeName = '/ServiceSuccessScreen';

  const ServiceSuccessScreen({
    super.key,
  });

  @override
  State<ServiceSuccessScreen> createState() => _ServiceSuccessScreenState();
}

class _ServiceSuccessScreenState extends State<ServiceSuccessScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(textAppBar: "ملخص الخدمة", showBack: true),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              text: "العودة للصفحة الرئيسية",
              onPressed: () {
                goToScreen(screenNames: ScreenNames.homeScreen);
              },
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: "تتبع الطلب",
              isButtonBorder: true,
              onPressed: () {
                goToScreen(screenNames: ScreenNames.myServices);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomImage(
              assetImg: AppImage.success,
              height: 125,
              width: 125,
            ),
            const SizedBox(height: 24),
            CustomText(
                text: "تم استلام طلبك",
                fontSize: 20,
                fontFamily: AppFonts.bold),
            const SizedBox(height: 16),
            CustomText(
              text:
                  "سيتم اشعارك عند قبول طلبك, جاري تحويلك الى بوابة علم لتفعيل حسابك",
              fontSize: 14,
              fontFamily: AppFonts.medium,
              textAlign: TextAlign.center,
              color: AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
