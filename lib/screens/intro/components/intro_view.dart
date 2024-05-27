import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahint/components/custom_image/custom_image.dart';

class IntroView extends StatelessWidget {
  final String assetImg;
  final String txt1;
  final bool? isLast;
  final int? index;

  const IntroView({
    super.key,
    required this.assetImg,
    required this.txt1,
    this.isLast = false,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomImage(
            assetImg: assetImg,
            height: 0.4.sh,
            width: 1.sw,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 0.01.sh),
        ],
      ),
    );
  }
}
