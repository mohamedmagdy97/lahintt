import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/button/button.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/utility/app_theme.dart';

class ServiceItem extends StatelessWidget {
  final int index;
  final bool? isCurrentService;
  final bool? isCanceledService;

  const ServiceItem({
    super.key,
    required this.index,
    this.isCurrentService = false,
    this.isCanceledService = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: "شطب سجل تجاري مؤسسة فردية",
              fontSize: 16,
              fontFamily: AppFonts.bold,
            ),
            if (isCurrentService ?? false)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: index == 0
                      ? AppColors.secondBtnColorLight
                      : AppColors.mainColorLight,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: CustomText(
                  text: index == 0 ? "بإنتظار الدفع" : "جاري المعالجة",
                  fontSize: 12.sp,
                  fontFamily: AppFonts.bold,
                  color: index == 0
                      ? AppColors.secondBtnColor
                      : AppColors.mainColor,
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.watch_later_outlined, size: 18),
            const SizedBox(width: 8),
            CustomText(
              text: "28-2-2024 • 2:30 PM",
              fontSize: 14,
              fontFamily: AppFonts.medium,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.monetization_on_outlined, size: 18),
            const SizedBox(width: 8),
            CustomText(
              text: "57.5 ر.س",
              fontSize: 14,
              fontFamily: AppFonts.medium,
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (isCurrentService ?? false)
          CustomButton(
            text: index == 0 ? "دفع الرسوم" : "تفاصيل الخدمة",
            onPressed: () {},
            color: index == 0 ? AppColors.secondBtnColor : null,
          ),
        if (!isCurrentService!)
          CustomButton(
            text: isCanceledService! ? "إعادة طلب الخدمة" : "تفاصيل الخدمة",
            onPressed: () =>goToScreen(screenNames: ScreenNames.serviceInProgressDetailsScreen),
            fontFamily: AppFonts.bold,
            color: AppColors.mainColorLight,
            colorFont: AppColors.mainColor,
          )
      ],
    );
  }
}
