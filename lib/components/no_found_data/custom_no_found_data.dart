import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/components/text/custom_auto_size_text.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';

class NoFoundData extends StatelessWidget {
  final String? img;
  final String? errorMessage;
  final String? errorMessage2;

  const NoFoundData({Key? key, this.errorMessage, this.img, this.errorMessage2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(56.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImage(
            assetImg: img ?? AppImage.no_data,
            width: 200.w,
            height: 200.h,
          ),
          SizedBox(height: 16.h),
          CustomTextAutoSize(
            text: errorMessage != null ? errorMessage! : GlobalWords.no_data.tr,
            color: AppColors.black,
            fontSize: 27.sp,
            textAlign: TextAlign.center,
            fontFamily: AppFonts.bold,
          ),
          if (errorMessage2 != null) ...[
            SizedBox(height: 16.h),
            CustomTextAutoSize(
              text: errorMessage2.toString(),
              color: AppColors.grey767D8E,
              fontSize: 18.sp,
              textAlign: TextAlign.center,
              fontFamily: AppFonts.regular,
            ),
          ]
        ],
      ),
    );
  }
}
