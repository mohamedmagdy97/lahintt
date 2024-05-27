import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:lahint/utility/app_theme.dart';

class ImageTitleDescWidget extends StatelessWidget {
  final String img;
  final String title;
  final String desc;
  final Widget? widget;

  const ImageTitleDescWidget({
    super.key,
    required this.img,
    required this.title,
    required this.desc,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // borderRadius: BorderRadius.circular(12),
              color: AppColors.bgAppBar),
          child: CustomImage(
            assetImg: img,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: title, fontSize: 16, fontFamily: AppFonts.medium),
            const SizedBox(height: 8),
            CustomText(text: desc, color: AppColors.grey, fontSize: 12),
          ],
        ),
        const Spacer(),
        widget ?? const SizedBox(),
      ],
    );
  }
}
