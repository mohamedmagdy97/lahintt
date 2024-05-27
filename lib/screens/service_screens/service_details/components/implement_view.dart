import 'package:flutter/material.dart';
import 'package:lahint/components/Text/custom_text.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';

class ImplementView extends StatelessWidget {
  const ImplementView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        StepperVerticalItem(
          title: "خدمتك قيد المراجعة",
          desc:
              "خدمتكم حالياً قيد المراجعة. يرجى الانتظار بصبر حتى نتمكن من استكمال العمل بأفضل جودة ممكنة. سنقوم بإعلامكم بأي تطورات في الوقت المناسب.",
        ),
        StepperVerticalItem(
          title: "الدفع",
          desc:
              "نشير إلى تحديد موعد لتقديم الخدمة المطلوبة في الثلاثاء، الساعة 10:00 صباحا. يرجى تأكيد حضورك في الموعد المحدد.",
        ),
        StepperVerticalItem(
          title: "تنفيذ الخدمة",
          desc:
              "قمنا بتنفيذ خدمتكم بنجاح. نتمنى أن تكونوا راضين عن النتائج ونتطلع إلى خدمتكم مرة أخرى في المستقبل.",
          isLast: true,
        ),
      ],
    );
  }
}

class StepperVerticalItem extends StatelessWidget {
  final String title;
  final String desc;
  final bool? isLast;

  const StepperVerticalItem({
    super.key,
    required this.title,
    required this.desc,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CustomImage(assetImg: AppImage.circle_dot),
                SizedBox(width: 8),
              ],
            ),
            if (!isLast!)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: CustomImage(assetImg: AppImage.dashed_line),
              )
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                fontSize: 18,
                fontFamily: AppFonts.bold,
                color: AppColors.darkColor,
              ),
              const SizedBox(height: 8),
              CustomText(text: desc, fontSize: 16),
            ],
          ),
        )
      ],
    );
  }
}
