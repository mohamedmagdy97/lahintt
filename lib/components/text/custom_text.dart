import 'package:flutter/material.dart';

import '../../utility/app_theme.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final Color? color;
  final Color? decorationColor;
  final double fontSize;
  final FontWeight? fontWeight;

  final int? maxLines;
  final double? height;
  final TextAlign? textAlign;
  final TextDecoration? decoration;

  const CustomText({
    Key? key,
    required this.text,
    this.color = AppColors.darkColor,
    this.fontWeight = FontWeight.normal,
    required this.fontSize,
    this.fontFamily,
    this.decorationColor,
    this.textAlign,
    this.height,
    this.decoration,
    this.maxLines = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          height: height ?? 1.4,
          fontSize: fontSize,
          fontFamily: fontFamily ?? AppFonts.regular,
          color: color,
          decoration: decoration ?? TextDecoration.none,
          decorationColor: decorationColor ?? AppColors.red,
          decorationStyle: TextDecorationStyle.solid
          // fontWeight: bold ? AppFonts.w700 : fontWeight,
          ),
      maxLines: maxLines,
    );
  }
}
