import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/helper/validation_form.dart';
import 'package:lahint/utility/app_setting.dart';

import '../../utility/app_theme.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final TextInputType inputType;
  final String labelText;
  final String hintText;
  final TextFieldValidatorType? textFieldVaidType;
  final TextEditingController controller;
  TextEditingController? confirmPasswordController;
  final String? firstPasswordToConfirm;
  double containtPaddingRight;
  bool obscureText;
  int? maxLength;
  int? maxLines;
  int? maxerrorLines;
  bool isDisable = false;
  double? borderRadius;
  double? iconDataHeight;
  double? iconDataWidth;
  double? hintFontSize;
  double? contentPadding;
  TextDirection? textDirection;
  void Function(String)? onChanged;
  void Function(String)? onFieldSubmitted;

  final String? prefixIcon;
  final String? suffixIcon;
  final Widget? suffix;
  final Widget? perfix;
  final GestureTapCallback? onTapSuffix;

  final Color? fillColor;
  final Color? fillBorderColor;
  final Color? hintColor;
  final Color? textColor;
  final Color? focusedBorderColor;

  CustomTextField({
    super.key,
    required this.controller,
    required this.inputType,
    this.obscureText = false,
    this.confirmPasswordController,
    required this.labelText,
    required this.hintText,
    required this.textFieldVaidType,
    this.containtPaddingRight = 20,
    this.maxLength,
    this.maxLines = 1,
    this.maxerrorLines = 2,
    this.borderRadius,
    this.iconDataHeight,
    this.iconDataWidth,
    this.isDisable = false,
    this.firstPasswordToConfirm,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onFieldSubmitted,
    this.suffix,
    this.perfix,
    this.onTapSuffix,
    this.fillColor,
    this.fillBorderColor,
    this.hintColor,
    this.hintFontSize,
    this.focusedBorderColor,
    this.textDirection,
    this.contentPadding,
    this.textColor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        hintColor: AppColors.secondaryColor.withOpacity(.9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText.isNotEmpty) ...[
            CustomText(
                text: widget.labelText,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: widget.textColor ?? AppColors.darkColor),
            const SizedBox(height: 8),
          ],
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: AppColors.mainColor,
            // cursorHeight: 12,
            controller: widget.controller,
            autofocus: false,
            maxLength: widget.maxLength,
            maxLines: widget.maxLines,
            textDirection: widget.textDirection ??
                (isArabic ? TextDirection.rtl : TextDirection.ltr),

            keyboardType: widget.inputType,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            obscureText: widget.obscureText,
            obscuringCharacter: '*',
            readOnly: widget.isDisable,
            validator: (v) => validation(
                type: widget.textFieldVaidType!,
                value: v!,
                firstPasswordForConfirm: widget.textFieldVaidType ==
                        TextFieldValidatorType.ConfirmPassword
                    ? widget.confirmPasswordController!.value.text
                    : ""),
            decoration: InputDecoration(
              hintTextDirection: widget.textDirection ??
                  (isArabic ? TextDirection.rtl : TextDirection.ltr),
              errorMaxLines: widget.maxerrorLines,
              counter: const Offstage(),
              errorStyle: TextStyle(
                  height: 1,
                  fontFamily: AppFonts.regular,
                  fontSize: 12.sp,
                  color: AppColors.red),
              fillColor: widget.isDisable
                  ? widget.fillColor ?? AppColors.lightGrey
                  : widget.fillColor ?? AppColors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  widget.borderRadius != null
                      ? widget.borderRadius!
                      : widget.maxLines == null
                          ? 4.sp
                          : 4.sp,
                ),
                borderSide: BorderSide(
                    color: widget.fillColor == null
                        ? widget.isDisable
                            ? Colors.transparent
                            : widget.fillBorderColor ?? AppColors.borderColor
                        : widget.fillBorderColor ?? AppColors.borderColor),
                gapPadding: 10,
              ),
              contentPadding: EdgeInsets.symmetric(
                  vertical: widget.contentPadding ?? 12,
                  horizontal: widget.contentPadding ?? 20),
              alignLabelWithHint: true,
              suffixIcon: widget.suffix ??
                  (widget.suffixIcon != null
                      ? Padding(
                          padding: EdgeInsets.all(16.sp),
                          child: InkWell(
                            onTap: widget.onTapSuffix,
                            child: CustomImage(
                              assetImg: widget.suffixIcon!,
                              width: 8,
                            ),
                          ),
                        )
                      : widget.textFieldVaidType ==
                                  TextFieldValidatorType.Password ||
                              widget.textFieldVaidType ==
                                  TextFieldValidatorType.ConfirmPassword
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.obscureText = !widget.obscureText;
                                });
                              },
                              child: widget.obscureText
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: AppColors.secondaryColorLight2,
                                      size: 20.sp,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: AppColors.secondaryColorLight2,
                                      size: 20.sp,
                                    ),
                            )
                          : null),
              prefixIconConstraints: const BoxConstraints(
                maxWidth: 40,
                minWidth: 40,
                maxHeight: 24,
              ),
              prefixIcon: widget.perfix ??
                  (widget.prefixIcon != null
                      ? CustomImage(
                          assetImg: widget.prefixIcon!,
                          color: AppColors.grey,
                          height: widget.iconDataHeight ?? 16.h,
                          width: widget.iconDataWidth ?? 16.w,
                        )
                      : null),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                  fontSize: widget.hintFontSize ?? 12.sp,
                  color: widget.hintColor ?? AppColors.textColorHint,
                  fontFamily: AppFonts.regular,
                  fontWeight: AppFonts.w400),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius != null
                    ? widget.borderRadius!
                    : widget.maxLines == null
                        ? 4.sp
                        : 4.sp),
                borderSide: BorderSide(
                    color: widget.fillBorderColor ?? AppColors.borderColor),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius != null
                    ? widget.borderRadius!
                    : widget.maxLines == null
                        ? 4.sp
                        : 4.sp),
                borderSide: BorderSide(
                    color: widget.focusedBorderColor ?? AppColors.black),
                gapPadding: 10,
              ),
            ),
            style: TextStyle(
              fontSize: 18.sp,
              height: 1.4,
              color: widget.textColor ?? AppColors.black,
              fontFamily: TextFieldValidatorType.Password ==
                          TextFieldValidatorType.Password ||
                      TextFieldValidatorType.ConfirmPassword ==
                          TextFieldValidatorType.ConfirmPassword
                  ? AppFonts.medium
                  : AppFonts.bold,
            ),
          ),
        ],
      ),
    );
  }
}
