import 'package:flutter/material.dart';
import 'package:lahint/screens/home/tabs/my_services/components/service_item.dart';
import 'package:lahint/utility/app_theme.dart';

class CanceledService extends StatelessWidget {
  const CanceledService({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.lightGrey),
        ),
        child: ServiceItem(index: index, isCanceledService: true),
      ),
    );
  }
}
