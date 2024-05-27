import 'package:flutter/material.dart';
import 'package:lahint/utility/app_setting.dart';

class TransFormFlipWidget extends StatelessWidget {
  final Widget child;

  const TransFormFlipWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Transform.flip(
      flipX: isArabic ? false : true,
      child: child,
    );
  }
}
