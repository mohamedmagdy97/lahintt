import 'package:flutter/material.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/utility/app_theme.dart';

class RequirementsView extends StatelessWidget {
  const RequirementsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              const Icon(Icons.circle, size: 12, color: AppColors.grey),
              const SizedBox(width: 8),
              CustomText(
                text: "الرقم المميز للمنشأة",
                fontSize: 16,
                fontFamily: AppFonts.medium,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
