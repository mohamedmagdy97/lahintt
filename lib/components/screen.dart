import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/components/loader_custom/loader_custom.dart';
import 'package:lahint/cubits/custom_items_cubits/loading_cubit/loading_cubit.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';

class Screen extends StatelessWidget {
  final Loading? loading;
  final bool? isAuthScreen;
  final Widget child;
  final Function()? onTap;

  const Screen({
    super.key,
    this.loading,
    this.onTap,
    required this.child,
    this.isAuthScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,
        appBar: isAuthScreen!
            ? AppBar(
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: onTap ?? () => goBack(),
                    child: CustomImage(
                        assetImg: AppImage.back, height: 24.h, width: 24.w),
                  ),
                ),

                toolbarHeight: 100,
                // leadingWidth: 24.w,
                // actions: const [LanguageWidget()],
              )
            : null,
        body: Stack(
          children: [
            child,
            if (loading != null) Loader(loading: loading!),
          ],
        ),
      ),
    );
  }
}
