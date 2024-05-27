import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/button/button.dart';
 import 'package:lahint/routes/routes.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';

customAlertMessage({
  required String? txt,
  String? txt2,
  required String alertType,
  bool isBarrierDismissible = false,
  Function? onClick,
}) async {
  return await showDialog(
    barrierDismissible: isBarrierDismissible,
    context: Get.context!,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return SimpleDialog(
            insetPadding: EdgeInsets.all(20.sp),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.sp))),
            contentPadding: const EdgeInsets.all(0),
            // title: const CustomImage(assetImg: AppImage.send),
/* CustomText(
              text: alertType,
              fontSize: 18.sp,
              fontFamily: AppFonts.heavy,
              fontWeight: AppFonts.w700,
              textAlign: TextAlign.center,
              color: AppColors.secondaryColor,
            ),*/
            children: [
              Column(
                // overflow: Overflow.visible,
                // alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 24.h, horizontal: 32.w),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              txt!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppFonts.bold,
                                color: AppColors.mainColor,
                                height: 1.4,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          if (txt2 != null)
                            Center(
                                child: CustomText(
                              text: txt2,
                              fontSize: 12.sp,
                              color: AppColors.secondaryColorLight,
                            )),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    width: 0.3.sw,
                    height: 40,
                    text: GlobalWords.next.tr,
                    fontSize: 14.sp,
                    fontFamily: AppFonts.bold,
                    onPressed: () => onClick != null ? onClick() : goBack(),
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ],
          );
        },
      );
    },
  );
}
