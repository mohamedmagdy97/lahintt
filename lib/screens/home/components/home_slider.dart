import 'package:carousel_slider/carousel_slider.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/models/slider_item_model.dart';
import 'package:lahint/screens/home/components/dots_item.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahint/utility/app_setting.dart';
import 'package:lahint/utility/app_theme.dart';

class HeaderSlider extends StatefulWidget {
  final List<SliderItemModel> slider;
  final Function onTapImage;

  const HeaderSlider(
      {super.key, required this.slider, required this.onTapImage});

  @override
  State<HeaderSlider> createState() => _HeaderSliderState();
}

class _HeaderSliderState extends State<HeaderSlider> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "الخدمات الأكثر طلبا",
          fontSize: 20.sp,
          fontFamily: AppFonts.bold,
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 100.h,
            viewportFraction: 0.85,
            initialPage: 0,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: false,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            autoPlayCurve: Curves.ease,
            onPageChanged: (currentIndex, c) =>
                setState(() => currentPage = currentIndex),
            scrollDirection: Axis.horizontal,
          ),
          items: widget.slider.map((sliderItem) {
            return GestureDetector(
              onTap: () => widget.onTapImage(sliderItem),
              child: sliderItem.image?.isNotEmpty == true
                  ? Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  // borderRadius: BorderRadius.circular(12),
                                  color: AppColors.bgAppBar),
                              child: CustomImage(
                                assetImg: sliderItem.image!.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),

                            const SizedBox(width: 8),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: 'استخراج رخصة قيادة',
                                    fontSize: 16,
                                    fontFamily: AppFonts.medium),
                                const SizedBox(height: 8),
                                const CustomText(
                                    text: 'يمكنك استخراج رخصة قيادة من هنا',
                                    color: AppColors.grey,
                                    fontSize: 12),
                              ],
                            ),
                            const Spacer(),
                            Transform.flip(
                                flipX: !isArabic ? false : true,
                                child:
                                    const CustomImage(assetImg: AppImage.back)),

                            // CachedNetworkImage(
                            //   height: 60,
                            //     imageUrl: sliderItem.image!,
                            //     fit: BoxFit.cover,
                            //     errorWidget: (_, __, ___) => Container(
                            //       decoration: const BoxDecoration(
                            //         shape: BoxShape.circle,
                            //         // borderRadius: BorderRadius.circular(40.sp),
                            //         image: DecorationImage(
                            //           fit: BoxFit.cover,
                            //           image: AssetImage(AppImage.default_home_img),
                            //         ),
                            //       ),
                            //     ),
                            //     imageBuilder: (context, imageProvider) => Container(
                            //       margin: const EdgeInsets.symmetric(horizontal: 8),
                            //       decoration: BoxDecoration(
                            //         shape: BoxShape.circle,
                            //
                            //         // borderRadius: BorderRadius.circular(40.sp),
                            //         image: DecorationImage(
                            //             image: imageProvider, fit: BoxFit.fill),
                            //       ),
                            //     ),
                            //     placeholder: (ctx, s) => Center(
                            //       child: CustomImage(
                            //           assetImg: AppImage.iosloader, height: 30.h),
                            //     ),
                            //   ),
                          ],
                        ),
                      ),
                    )
                  : Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.sp),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.sp),
                          image: const DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(AppImage.logo),
                          ),
                        ),
                      ),
                    ),
            );
          }).toList(),
        ),

        /// dots
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.slider.length,
            (index) => DotsItems(index: index, currentPage: currentPage),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
