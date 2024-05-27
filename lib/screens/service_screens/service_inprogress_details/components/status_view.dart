import 'package:flutter/material.dart';
import 'package:lahint/components/button/button.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';

class StatusView extends StatelessWidget {
  const StatusView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomImage(assetImg: AppImage.sc2),
          const SizedBox(height: 16),
          CustomButton(
            text: "تحميل الفاتورة",
            isButtonBorder: true,
            fontFamily: AppFonts.bold,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
