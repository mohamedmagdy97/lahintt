import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:lahint/utility/app_theme.dart';

class ServiceCard extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final String description;
  final String image;

  const ServiceCard(
      {super.key,
      this.onTap,
      required this.title,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        child: Container(
          // shadowColor: AppColors.lightGrey,
          // elevation: 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.lightGrey,width: 1)
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      // borderRadius: BorderRadius.circular(12),
                      color: AppColors.bgAppBar),
                  child: CustomImage(
                    assetImg: image,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: title.toString(),
                        fontSize: 16,
                        fontFamily: AppFonts.medium),
                    const SizedBox(height: 8),
                    CustomText(
                      text: description.toString(),
                      color: AppColors.grey,
                      fontSize: 12,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
