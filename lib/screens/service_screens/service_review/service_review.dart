import 'package:flutter/material.dart';
import 'package:lahint/components/button/button.dart';
import 'package:lahint/components/custom_app_bar/custom_app_bar.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/utility/app_theme.dart';

class ServiceReviewScreen extends StatefulWidget {
  static String routeName = '/ServiceReviewScreen';

  const ServiceReviewScreen({
    super.key,
  });

  @override
  State<ServiceReviewScreen> createState() => _ServiceReviewScreenState();
}

class _ServiceReviewScreenState extends State<ServiceReviewScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(textAppBar: "ملخص الخدمة", showBack: true),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              text: "تأكيد الخدمة",
              onPressed: () {
                goToScreen(screenNames: ScreenNames.serviceSuccessScreen);
              },
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: "تغيير الموعد",
              isButtonBorder: true,
              onPressed: () {
                goBack();
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Divider(),
          const SizedBox(height: 8),
          const ReviewItem(title: "الخدمة", value: "اعداد عقد عمل لوافد"),
          const ReviewItem(title: "اسم مقدم الخدمة", value: "مصطفي خالد"),
          const ReviewItem(title: "توقيت الحجز", value: "28-6-2023 • 2:30PM"),
          const ReviewItem(title: "سؤال الخدمة 1", value: "مصطفي خالد"),
          const ReviewItem(title: "سؤال الخدمة 2", value: "مصطفي خالد"),
          const ReviewItem(title: "سؤال الخدمة 3", value: "مصطفي خالد"),
          const ReviewItem(title: "رسالتك", value: "مصطفي خالد"),
          const Divider(),
          const SizedBox(height: 8),
          Row(
            children: [
              Checkbox(
                value: true,
                activeColor: AppColors.mainColor,
                onChanged: (v) {},
              ),
              CustomText(
                text: "برجاء الموافقة على شروط الأستخدام والخصوصية لاهنت 2023.",
                fontSize: 12,
                fontFamily: AppFonts.medium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  final String title;
  final String value;

  const ReviewItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: AppColors.lightGrey, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            fontSize: 16,
            fontFamily: AppFonts.medium,
            color: AppColors.grey,
          ),
          CustomText(
            text: value,
            fontSize: 16,
            fontFamily: AppFonts.bold,
          ),
        ],
      ),
    );
  }
}
