import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/components/text/custom_auto_size_text.dart';
import 'package:lahint/components/button/button.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';

customAlertOptional({
  required String title,
  required String alertType,
  required Function onTap,
  required Function onCancel,
  String? textButton,
  String? textSecondButton,
  bool barrierDismissible = false,
  bool willPopScope = true,
}) async {
  return await showDialog(
    barrierDismissible: barrierDismissible,
    context: Get.context!,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return WillPopScope(
            onWillPop: () async => willPopScope,
            child: SimpleDialog(
              insetPadding: EdgeInsets.all(20.sp),
              contentPadding: EdgeInsets.all(18.sp),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.sp))),
              children: [
                SizedBox(
                  width: 1.sw,
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        const CustomImage(
                            assetImg: AppImage.warning, width: 30, height: 30),
                        const SizedBox(height: 16),
                        SizedBox(height: 6.h),
                        CustomTextAutoSize(
                          text: alertType,
                          maxLines: 1,
                          fontSize: 16.sp,
                          textAlign: TextAlign.center,
                          color: AppColors.mainColor,
                          fontFamily: AppFonts.bold,
                        ),
                        SizedBox(height: 18.h),
                        CustomTextAutoSize(
                          text: title,
                          fontSize: 12.sp,
                          textAlign: TextAlign.center,
                          fontWeight: AppFonts.w400,
                          color: AppColors.textColorTitle,
                          height: 1.5.h,
                          fontFamily: AppFonts.regular,
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                              width: .25.sw,
                              isButtonBorder: true,
                              onPressed: () => onCancel(),
                              text: textSecondButton ?? GlobalWords.ignore.tr,
                            ),
                            CustomButton(
                              // height:  40.h,
                              width: .35.sw,
                              onPressed: () => onTap(),
                              text: textButton ?? GlobalWords.ok.tr,
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
