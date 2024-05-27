import 'package:flutter/material.dart';
import 'package:lahint/components/button/button.dart';
import 'package:lahint/components/custom_app_bar/custom_app_bar.dart';
import 'package:lahint/components/custom_steper.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/screens/service_screens/ask_service_step_three/ask_service_step_three_data.dart';
import 'package:lahint/utility/app_theme.dart';

class AskServiceStepThreeScreen extends StatefulWidget {
  static String routeName = '/AskServiceStepThreeScreen';

  const AskServiceStepThreeScreen({
    super.key,
  });

  @override
  State<AskServiceStepThreeScreen> createState() =>
      _AskServiceStepThreeScreenState();
}

class _AskServiceStepThreeScreenState extends State<AskServiceStepThreeScreen> {
  AskServiceStepThreeData askServiceStepThreeData = AskServiceStepThreeData();

  @override
  void initState() {
    askServiceStepThreeData.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(textAppBar: "", showBack: true),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          text: "طلب الخدمة",
          onPressed: () {
            goToScreen(screenNames: ScreenNames.serviceReviewScreen);
          },
        ),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        padding: const EdgeInsets.all(16),
        children: [
          const CustomStepper(title: "تحديد الموعد", step: 3),
          CustomText(
              text: "أختر اليوم", fontSize: 18, fontFamily: AppFonts.bold),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                5,
                (index) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: index == 0
                              ? AppColors.mainColor
                              : AppColors.lightGrey)),
                  child: Column(
                    children: [
                      CustomText(
                        text: "اليوم",
                        fontSize: 12,
                        fontFamily: AppFonts.bold,
                        color: index == 0 ? AppColors.mainColor : null,
                      ),
                      const SizedBox(height: 8),
                      CustomText(
                        text: "14-2-2024",
                        fontSize: 12,
                        color: index == 0 ? AppColors.mainColor : null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          CustomText(
              text: "أختر الميعاد", fontSize: 18, fontFamily: AppFonts.bold),
          const SizedBox(height: 16),
          CustomText(
            text: "صباحا",
            fontSize: 16,
            fontFamily: AppFonts.medium,
            color: AppColors.grey,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: List.generate(
              6,
              (index) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: index == 0
                            ? AppColors.mainColor
                            : AppColors.lightGrey)),
                child: CustomText(
                  text: "12:00 صباحا",
                  fontSize: 12,
                  fontFamily: AppFonts.bold,
                  color: index == 0 ? AppColors.mainColor : null,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          CustomText(
            text: "مساءا",
            fontSize: 16,
            fontFamily: AppFonts.medium,
            color: AppColors.grey,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: List.generate(
              9,
              (index) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: index == 0
                            ? AppColors.mainColor
                            : AppColors.lightGrey)),
                child: CustomText(
                  text: "12:00 صباحا",
                  fontSize: 12,
                  fontFamily: AppFonts.bold,
                  color: index == 0 ? AppColors.mainColor : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
