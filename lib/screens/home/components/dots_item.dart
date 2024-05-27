import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahint/utility/app_theme.dart';

class DotsItems extends StatelessWidget {
  final int index;
  final int currentPage;

  const DotsItems({Key? key, required this.index, required this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: currentPage == index ? 8.h : 6.h,
      width: currentPage == index ? 8.h : 6.h,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
          color: currentPage == index ? AppColors.mainColor : Colors.grey,
          borderRadius: BorderRadius.circular(3.sp)),
    );
  }
}
