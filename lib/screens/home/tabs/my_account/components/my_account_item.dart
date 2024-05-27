import 'package:flutter/material.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/utility/app_theme.dart';

class MyAccountItem extends StatelessWidget {
  final String icon;
  final String title;
  final bool? removeBorder;
  final GestureTapCallback? onTap;

  const MyAccountItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.removeBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(removeBorder ?? false ? 8 : 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: removeBorder ?? false
                  ? Colors.transparent
                  : AppColors.lightGrey,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImage(assetImg: icon, height: 40, width: 40),
              const SizedBox(width: 16),
              CustomText(
                text: title,
                fontSize: 16,
                fontFamily: AppFonts.medium,
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
