import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/custom_app_bar/custom_app_bar.dart';
import 'package:lahint/screens/home/components/navigation_bar/custom_navigation_bar.dart';
 import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';

class PrivacyScreen extends StatefulWidget {
  static String routeName = '/PrivacyScreen';

  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          textAppBar: GlobalWords.privacy_policy.tr, showBack: true),
      bottomNavigationBar: const MenuApp(MenuState.myAccount),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CustomText(
            text: "دور لاهنت في حماية خصوصية وسرية العملاء:",
            fontSize: 18,
            fontFamily: AppFonts.medium,
            color: AppColors.mainColor,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const CustomText(
            text:
                "الامتثال لنظام حماية البيانات الشخصية السعودي: تلتزم شركة لاهنت لخدمات الأعمال بالامتثال لنظام حماية البيانات الشخصية في المملكة العربية السعودية. نحرص على تطبيق جميع المبادئ والمتطلبات الواردة في هذا النظام لحماية خصوصية العملاء وسرية معلوماتهم.",
            fontSize: 16,
          ),
          const SizedBox(height: 16),
          const CustomText(
            text:
                "حماية بيانات العملاء: نحرص على حماية بيانات العملاء من الوصول غير المصرح به والاستخدام غير القانوني. نستخدم تقنيات الأمان المتقدمة والتشفير لضمان سرية المعلومات ومنع انتهاكات الخصوصية.",
            fontSize: 16,
          ),
          const SizedBox(height: 16),
          const CustomText(
            text:
                "سرية المعلومات: نضمن سرية المعلومات التي يشاركها العملاء معنا. نحافظ على سرية المعلومات الشخصية والتجارية ونمنع الوصول إليها من قبل الأشخاص غير المصرح لهم.",
            fontSize: 16,
          ),
          const SizedBox(height: 16),
          const CustomText(
            text:
                "الشفافية والتوعية: نعمل على توعية العملاء بأهمية حماية خصوصيتهم وسرية معلوماتهم. نقدم معلومات شافية وشفافة حول كيفية جمع واستخدام المعلومات والتدابير التي نتخذها لحمايتها، مما يمكن العملاء من اتخاذ قرارات مستنيرة والشعور بالثقة في التعامل معنا.",
            fontSize: 16,
          ),
          const SizedBox(height: 16),
          const CustomText(
            text:
                "الحفاظ على الأمان: نقوم بتنفيذ إجراءات أمان قوية لحماية بيانات العملاء من الاختراق والتلاعب. نحافظ على بيئة آمنة لتخزين ومعالجة المعلومات ونقوم بتحديث وتطوير نظم الأمان بشكل منتظم للتأكد من مواكبتها لأحدث التهديدات والتحديات الأمنية.",
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
