import 'package:flutter/material.dart';

import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/custom_app_bar/custom_app_bar.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/screens/home/components/navigation_bar/custom_navigation_bar.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';

class AttachmentsScreen extends StatefulWidget {
  static String routeName = '/AttachmentsScreen';

  const AttachmentsScreen({super.key});

  @override
  _AttachmentsScreenState createState() => _AttachmentsScreenState();
}

class _AttachmentsScreenState extends State<AttachmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MenuApp(MenuState.support),
      appBar: CustomAppBar(
        showBack: true,
        customTitle: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: "الملحقات",
              fontSize: 17,
              fontFamily: AppFonts.bold,
            ),
            const SizedBox(height: 8),
            const CustomText(text: "اعداد عقد عمل لوافد", fontSize: 14),
            const SizedBox(height: 4),
            const CustomText(
              text: "#245637",
              fontSize: 14,
              color: AppColors.grey,
            ),
          ],
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          // reverse: true,
          itemCount: 4,
          itemBuilder: (context, index) => Column(
                children: [
                  const Divider(height: 5, color: AppColors.lightGrey),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const CustomImage(
                          assetImg: AppImage.logo,
                          height: 26,
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "هوية وطنية",
                              fontSize: 16,
                              fontFamily: AppFonts.medium,
                            ),
                            const SizedBox(height: 8),
                            const CustomText(
                              text: "28-6-2023 • 2:30PM",
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
    );
  }
}
