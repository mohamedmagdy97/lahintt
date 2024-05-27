import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/button/button.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:flutter/material.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/utility/app_theme.dart';
import '../../components/custom_image/custom_image.dart';

class FailScreen extends StatefulWidget {
  static String routeName = '/FailScreen';

  const FailScreen({super.key});

  @override
  State<FailScreen> createState() => _FailScreenState();
}

class _FailScreenState extends State<FailScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(assetImg: AppImage.fail, height: 0.15.sh),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: CustomText(
                text: HourlyTR.paymentFail.tr,
                fontSize: 16.sp,
                color: AppColors.mainColor,
                fontFamily: AppFonts.bold,
              ),
            ),
            CustomButton(
              text: IndivL.backtohome.tr,
              onPressed: () =>
                  goToWithRemoveRoute(screenNames: ScreenNames.homeScreen),
            ),
          ],
        ),
      ),
    );
  }
}
