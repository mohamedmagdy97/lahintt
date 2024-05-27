import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lahint/utility/all_app_words.dart';

import '../custom_image/custom_image.dart';

class CustomCacheImageNetwork extends StatelessWidget {
  final String imageUrl;
  final BoxShape? boxShape;
  final Widget? defaultImage;
  final String? errorImg;
  final double? height;
  final double? width;
  final double? placeholderWidth;
  final double? placeholderHeight;
  final double? borderRadius;
  final BoxFit? fit;

  const CustomCacheImageNetwork(
      {super.key,
      required this.imageUrl,
      this.boxShape,
      this.height,
      this.width,
      this.errorImg,
      this.placeholderWidth,
      this.placeholderHeight,
      this.fit,
      this.borderRadius,
      this.defaultImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 35.h,
      width: width ?? 35.w,
      decoration: BoxDecoration(
        shape: boxShape ?? BoxShape.circle,
      ),
      child: imageUrl.toLowerCase().contains('.svg')
          ? ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
              child: SvgPicture.network(imageUrl,
                  fit: fit ?? BoxFit.cover,
                  height: height,
                  width: width,
                  placeholderBuilder: (BuildContext context) => Center(
                          child: Image.asset(
                        AppImage.iosloader,
                        height: placeholderHeight ?? 20.h,
                        width: placeholderWidth ?? 20.w,
                      ))),
            )
          : CachedNetworkImage(
              imageUrl: imageUrl,
              fit: fit,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  shape: boxShape ?? BoxShape.rectangle,
                  borderRadius: boxShape != null
                      ? null
                      : BorderRadius.circular(borderRadius ?? 12),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: fit ?? BoxFit.fill,
                  ),
                ),
              ),
              // cacheManager: CacheManager(
              //   Config(
              //     'cacheKey',
              //     stalePeriod: const Duration(days: 7),
              //   ),
              // ),
              placeholder: (context, url) => Center(
                child: Image.asset(
                  AppImage.iosloader,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
              errorWidget: (context, url, error) => defaultImage != null
                  ? defaultImage!
                  : CustomImage(assetImg: errorImg ?? AppImage.logo),
            ),
    );
  }
}
