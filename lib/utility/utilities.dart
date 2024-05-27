import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/utility/app_theme.dart';

class Utilities {
  customSnackBarTerms(BuildContext context, {String? txt}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomText(
          text: txt ?? 'يجب الموافقة على سياسة الخصوصية',
          fontSize: 16.sp,
          color: AppColors.white,
        ),
        // padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        backgroundColor: AppColors.textColorTitle,
      ),
    );
  }
}
