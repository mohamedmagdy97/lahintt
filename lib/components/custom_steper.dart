import 'package:flutter/material.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/utility/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStepper extends StatelessWidget {
  final String title;
  final int step;

  const CustomStepper({
    super.key,
    required this.title,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 5,
              decoration: BoxDecoration(
                  color: AppColors.mainColorLight,
                  borderRadius: BorderRadius.circular(4)),
            ),
            Container(
              height: 5,
              width: (1.sw / 3) * step,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(4)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: title,
              fontSize: 24,
              fontFamily: AppFonts.bold,
            ),
            CustomText(
              text: "$step/3",
              fontSize: 14,
              fontFamily: AppFonts.bold,
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
