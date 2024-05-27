import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lahint/components/image/cutom_cache_image_network.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';

class CustomImage extends StatelessWidget {
  final String assetImg;
  final String? errorImg;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? color;
  final BoxFit? fit;

  const CustomImage({
    super.key,
    required this.assetImg,
    this.errorImg,
    this.height,
    this.width,
    this.borderRadius,
    this.color,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return assetImg.contains('.svg') && !assetImg.contains('http')
        ? SvgPicture.asset(
            assetImg,
            height: height,
            width: width,
            fit: fit ?? BoxFit.contain,
            placeholderBuilder: (_) => const Icon(
              Icons.info_outline,
              size: 30,
              color: AppColors.mainColor,
            ),
            color: color,
          )
        : assetImg.contains('http')
            ? CustomCacheImageNetwork(
                imageUrl: assetImg,
                errorImg: errorImg,
                height: height,
                fit: fit ?? BoxFit.cover,
                width: width,
                borderRadius: borderRadius,
              )
            : assetImg.toString() == "null" || assetImg.isEmpty
                ? SvgPicture.asset(
                    AppImage.logo,
                    height: height,
                    width: width,
                    placeholderBuilder: (_) => const Icon(
                      Icons.info_outline,
                      size: 30,
                      color: AppColors.mainColor,
                    ),
                    fit: fit ?? BoxFit.contain,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(borderRadius ?? 0),
                    child: Image.asset(
                      assetImg,
                      height: height,
                      fit: BoxFit.contain,
                      color: color,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.info_outline,
                        size: 30,
                        color: AppColors.mainColor,
                      ),
                    ),
                  );
  }
}
