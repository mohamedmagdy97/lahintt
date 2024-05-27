import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahint/components/text/custom_auto_size_text.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_setting.dart';
import 'package:lahint/utility/app_theme.dart';

import '../custom_image/custom_image.dart';

class CustomAppBar extends PreferredSize {
  final String? textAppBar;
  final String? textAppBar2;
  final bool canBack;
  final bool showNotification;
  final Widget? widget;
  final Widget? customTitle;
  final bool showDrawer;
  final bool? showBack;
  final Function? onBackPressed;

  CustomAppBar({
    super.key,
    this.textAppBar,
    this.textAppBar2,
    this.onBackPressed,
    this.canBack = true,
    this.showNotification = false,
    this.widget,
    this.customTitle,
    this.showDrawer = false,
    this.showBack = false,
  }) : super(
          child: const SizedBox(),
          preferredSize: Size.fromHeight(/*isHome ? 75.h :*/ 80.h),
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: AppBar(
      toolbarHeight: /*isHome ? 75.h :*/ customTitle != null ? 100.h : 80.h,
      backgroundColor: AppColors.appBarColor,
      elevation: 0,
      centerTitle: true,
      titleSpacing: 0,
      title: customTitle ??
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextAutoSize(
                text: textAppBar ?? "",
                color: AppColors.textColorTitle,
                fontFamily: AppFonts.bold,
                textAlign: TextAlign.start,
                fontSize: 20.sp,
              ),
              CustomTextAutoSize(
                text: textAppBar2 ?? "",
                fontSize: 13.sp,
                textAlign: TextAlign.center,
                color: AppColors.grey767D8E,
              ),
            ],
          ),
      leading: widget ??
          (showDrawer == true
              ? IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const CustomImage(
                    assetImg: AppImage.menuIcon,
                    // width: 25.06.w,
                    // height: 22.h,
                  ),
                )
              : showBack!
                  ? IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        if (Navigator.canPop(context)) {
                          onBackPressed == null ? goBack() : onBackPressed!();
                        } else {
                          onBackPressed == null
                              ? () {
                                  goToWithRemoveRoute(
                                    screenNames: ScreenNames.homeScreen,
                                  );
                                }
                              : onBackPressed!();
                        }
                      },
                      icon: Transform(
                        alignment: Alignment.center,
                        transform: isArabic
                            ? Matrix4.rotationX(0)
                            : Matrix4.rotationY(math.pi),
                        child: const CustomImage(
                          assetImg: AppImage.back,

                          // width: 24.w,
                          // height: 24.h,
                        ),
                      ),
                    )
                  : const SizedBox()),

      /// notification icon
      /*actions: [
        (showNotification || isHome) &&
                !BlocProvider.of<UserCubit>(Get.context!, listen: false)
                    .iSUserVisitor
            ? IconButton(
                onPressed: () {
                  if (Get.currentRoute != ScreenNames.userNotificationScreen) {
                    goToScreen(screenNames: ScreenNames.userNotificationScreen);
                  }

                  // customAlertMessage(
                  //     txt: GlobalWords.under_maintenance.tr,
                  //     alertType: GlobalWords.sorry.tr,
                  //     onClick: () {
                  //       goBack();
                  //     });
                },
                icon: const CustomImage(
                  assetImg: AppImage.notificationIcon,
                  // width: 25.w,
                  // height: 28.h,
                ),
              )
            : const SizedBox(),
      ],*/
    ));
  }
}
