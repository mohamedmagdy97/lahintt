import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/components/loader_custom/loader_custom.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/cubits/custom_items_cubits/loading_cubit/loading_cubit.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/utility/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? horizontalPadding;
  final Function? onPressed;
  final double? fontSize;
  final String? fontFamily;
  final Color? color;
  final Color? colorFont;
  final bool isButtonBorder;
  final bool isSecondButton;
  final String? assetImg;

  final Color? borderColor;
  final Loading? loading;

  const CustomButton({
    super.key,
    this.height,
    this.width,
    this.onPressed,
    this.horizontalPadding,
    this.fontSize,
    this.fontFamily,
    required this.text,
    this.loading,
    this.colorFont,
    this.borderRadius,
    this.isButtonBorder = false,
    this.isSecondButton = false,
    this.color,
    this.assetImg,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 56.h,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 4.sp),
        color: isSecondButton
            ? AppColors.secondaryColorOpacity
            : isButtonBorder
                ? Colors.transparent
                : color ?? AppColors.mainColor,
        border: isButtonBorder
            ? Border.all(
                color: borderColor == null ? AppColors.mainColor : borderColor!,
                width: 1)
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(4.sp),
          onTap: () => onPressed == null ? goBack() : onPressed!(),
          child: Center(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: horizontalPadding ?? 4.0),
              child: loading != null
                  ? BlocBuilder<Loading, LoadingState>(
                      bloc: loading,
                      builder: (context, state) {
                        if (state is LoadingChange) {
                          return state.loading!
                              ? WillPopScope(
                                  child: const LoaderItem(isBtn: true),
                                  onWillPop: () async {
                                    loading!.hide;
                                    return true;
                                  },
                                )
                              : CustomText(
                                  text: text,
                                  fontSize: fontSize ?? 14.sp,
                                  fontFamily: isSecondButton || isButtonBorder
                                      ? fontFamily == AppFonts.regular
                                          ? AppFonts.regular
                                          : AppFonts.bold
                                      : fontFamily ?? AppFonts.bold,
                                   height: 1,
                                  //  .8.h,
                                  color: isSecondButton || isButtonBorder
                                      ? AppColors.mainColor
                                      : colorFont ?? Colors.white,
                                  maxLines: 1,
                                );
                        } else {
                          return CustomText(
                            text: text,
                            fontSize: fontSize ?? 14.sp,
                            fontFamily: isSecondButton
                                ? fontFamily == AppFonts.regular
                                    ? AppFonts.regular
                                    : AppFonts.bold
                                : fontFamily ?? AppFonts.regular,
                             height: 1,
                            //  .8.h,
                            color: isSecondButton || isButtonBorder
                                ? AppColors.mainColor
                                : colorFont ?? Colors.white,
                            maxLines: 1,
                          );
                        }
                      },
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (assetImg != null) ...[
                          CustomImage(
                              assetImg: assetImg ?? "", height: 20, width: 20),
                          const SizedBox(width: 8),
                        ],
                        CustomText(
                          text: text,
                          fontSize: fontSize ?? 14.sp,
                          fontFamily: isSecondButton
                              ? fontFamily == AppFonts.regular
                                  ? AppFonts.regular
                                  : AppFonts.bold
                              : fontFamily ?? AppFonts.regular,
                          fontWeight: AppFonts.w400,
                          height: 1,
                          //  .8.h,
                          color: isSecondButton || isButtonBorder
                              ? colorFont ?? AppColors.mainColor
                              : colorFont ?? Colors.white,
                          maxLines: 1,
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
