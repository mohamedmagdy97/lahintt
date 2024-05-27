import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/components/trans_form_flip_widget.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';

class ServiceDetailsHeader extends StatelessWidget {
  const ServiceDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainColor,
      // width: 1.sw,
      height: 200,
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 135.h,
              width: 125.w,
              child: const CustomImage(
                assetImg: AppImage.homeShape,
                color: AppColors.greyTrans,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => goBack(),
                  child: const TransFormFlipWidget(
                    child: CustomImage(
                      assetImg: AppImage.back,
                      color: AppColors.white,
                      // width: 24.w,
                      // height: 24.h,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        CustomText(
                          text: "اعداد عقد عمل لوافد",
                          fontSize: 24,
                          color: AppColors.white,
                          fontFamily: AppFonts.bold,
                        ),
                      ],
                    ),
                    const CustomImage(assetImg: AppImage.dots),
                  ],
                ),
                const SizedBox(height: 30),
                // InkWell(
                //   onTap: () =>
                //       goToScreen(screenNames: ScreenNames.searchScreen),
                //   child: Container(
                //     // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                //     padding: const EdgeInsets.all(16),
                //     decoration: BoxDecoration(
                //         color: AppColors.bgAppBar,
                //         borderRadius: BorderRadius.circular(8),
                //         border: Border.all(color: AppColors.bord)),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         const Icon(
                //           Icons.search,
                //           color: AppColors.grey767D8E,
                //           size: 24,
                //         ),
                //         const SizedBox(width: 8),
                //         CustomText(
                //           text: AppWords.search_about.tr,
                //           fontSize: 16.sp,
                //           color: AppColors.grey767D8E,
                //           fontFamily: AppFonts.bold,
                //         )
                //       ],
                //     ),
                //   ),
                // ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const CustomText(
                            text: "سعر الخدمة",
                            fontSize: 12,
                            color: AppColors.lightGrey),
                        const SizedBox(height: 8),
                        CustomText(
                          text: "44 sar",
                          fontSize: 20,
                          color: AppColors.lightGrey,
                          fontFamily: AppFonts.bold,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CustomText(
                          text: "الرسوم الحكومية",
                          fontSize: 12,
                          fontFamily: AppFonts.medium,
                          color: AppColors.lightGrey,
                        ),
                        const SizedBox(height: 8),
                        CustomText(
                          text: "44 sar",
                          fontSize: 20,
                          color: AppColors.lightGrey,
                          fontFamily: AppFonts.bold,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const CustomText(
                            text: "الإجمالي",
                            fontSize: 12,
                            color: AppColors.lightGrey),
                        const SizedBox(height: 8),
                        CustomText(
                          text: "44 sar",
                          fontSize: 20,
                          color: AppColors.lightGrey,
                          fontFamily: AppFonts.bold,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
