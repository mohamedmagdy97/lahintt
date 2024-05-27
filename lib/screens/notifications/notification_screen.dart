import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/custom_app_bar/custom_app_bar.dart';
import 'package:lahint/components/image_title_desc_widget.dart';
import 'package:lahint/screens/home/components/navigation_bar/custom_navigation_bar.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';

class UserNotificationScreen extends StatefulWidget {
  static String routeName = '/UserNotificationScreen';

  const UserNotificationScreen({super.key});

  @override
  State<UserNotificationScreen> createState() => _UserNotificationScreenState();
}

class _UserNotificationScreenState extends State<UserNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          showBack: true,
          textAppBar: AppWords.notification.tr,
        ),
        bottomNavigationBar: const MenuApp(MenuState.home),
        body: Column(
          children: List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: ImageTitleDescWidget(
                img: AppImage.visa,
                title: 'تم الغاء طلبك',
                desc:
                    'تم إلغاء الطلب الخاص باصدار رخصة القيادة برجاء التواصل مع الدعم الفني',
                widget: CustomText(
                  text: "3 دقائق",
                  fontSize: 16,
                  fontFamily: AppFonts.medium,
                ),
              ),
            ),
          ),
        ));
  }
}
