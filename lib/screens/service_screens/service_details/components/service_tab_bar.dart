import 'package:flutter/material.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/utility/app_theme.dart';

class ServiceTabBar extends StatelessWidget {
  const ServiceTabBar({
    super.key,
    required this.tabController,
  });

  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      // isScrollable: true,
      controller: tabController,
      onTap: (a) {
        print('ddd==$a');
      },
      tabs: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: CustomText(
            text: 'وصف الخدمة',
            fontSize: 13,
            fontFamily: AppFonts.bold,
            color: /*tabController!.previousIndex == index - 1
                ? AppColors.mainColor
                : */
                AppColors.darkColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: CustomText(
            text: 'متطلبات الخدمة',
            fontSize: 13,
            fontFamily: AppFonts.bold,
            color: /*tabController!.previousIndex == index - 1
                ? AppColors.mainColor
                : */
                AppColors.darkColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: CustomText(
            text: 'تنفيذ الخدمة',
            fontSize: 13,
            fontFamily: AppFonts.bold,
            color: /*tabController!.previousIndex == index - 1
                ? AppColors.mainColor
                : */
                AppColors.darkColor,
          ),
        ),
      ],

      indicatorColor: AppColors.mainColor,

      indicatorSize: TabBarIndicatorSize.label,
    );
  }
}
