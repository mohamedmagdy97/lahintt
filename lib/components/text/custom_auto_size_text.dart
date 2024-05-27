import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lahint/utility/app_theme.dart';

class CustomTextAutoSize extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final Color? color;
  final double fontSize;
  final bool bold;
  final bool wrapWords;
  final FontWeight? fontWeight;

  final int? maxLines;

  final double? height;

  final TextAlign? textAlign;
  final bool lineThrough;

  const CustomTextAutoSize(
      {Key? key,
      required this.text,
        this.color,
      this.bold = false,
      this.lineThrough = false,
      this.fontWeight = FontWeight.normal,
      required this.fontSize,
      this.fontFamily,
      this.textAlign,
      this.height = 1.4,
      this.wrapWords = true,
      this.maxLines = 99})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text.toString(),
      textAlign: textAlign,
      minFontSize: 6,
      wrapWords: wrapWords,
      style: TextStyle(
        height: height,
        decoration: lineThrough ? TextDecoration.lineThrough : null,
        fontSize: fontSize,
        fontFamily: fontFamily ?? AppFonts.regular,
        color: color ?? AppColors.borderColor,
        // fontWeight: bold ? FontWeight.bold : fontWeight,
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: maxLines,
    );
  }
}
