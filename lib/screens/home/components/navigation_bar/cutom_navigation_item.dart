import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/components/text/custom_auto_size_text.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';

class NavigationButton extends StatelessWidget {
  final Function() onTap;
  final String buttonName;
  final String buttonImg;
  final String buttonSelectedImg;
  final bool isSelected;

  const NavigationButton({
    super.key,
    required this.onTap,
    required this.buttonName,
    required this.buttonImg,
    required this.buttonSelectedImg,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImage(
                assetImg: isSelected ? buttonSelectedImg : buttonImg,
                height: 25.h,
                color: isSelected ? AppColors.mainColor : AppColors.grey,
              ),
              SizedBox(height: 8.h),
              CustomTextAutoSize(
                text: buttonName.tr,
                color: AppColors.cardColor3,
                fontSize: 12.sp,
              ),
              SizedBox(height: 8.h),
              if (isSelected)
                CustomImage(
                  assetImg: AppImage.shape_bottom_nav,
                  width: 33.h,
                  color: AppColors.mainColor,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
