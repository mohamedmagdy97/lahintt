import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
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
              height: 160.h,
              width: 145.w,
               child: const CustomImage(assetImg: AppImage.homeShape,color: AppColors.greyTrans,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "مرحبا بك 👋",
                          fontSize: 12,
                          color: AppColors.white,
                        ),
                        SizedBox(height: 8),
                        CustomText(
                          text: "خليل السعدي",
                          fontSize: 14,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: ()=>goToScreen(screenNames: ScreenNames.userNotificationScreen),
                      child: CircleAvatar(
                          backgroundColor: AppColors.mainColor2.withOpacity(0.2),
                          child: const CustomImage(assetImg: AppImage.notify)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () => goToScreen(screenNames: ScreenNames.searchScreen),
                  child: Container(
                    // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: AppColors.bgAppBar,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.bord)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.search,
                          color: AppColors.grey767D8E,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        CustomText(
                          text: AppWords.search_about.tr,
                          fontSize: 16.sp,
                          color: AppColors.grey767D8E,
                          fontFamily: AppFonts.bold,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
