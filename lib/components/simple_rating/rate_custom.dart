import 'package:lahint/components/text/custom_auto_size_text.dart';
import 'package:lahint/utility/app_theme.dart';
import 'package:flutter/material.dart';
import 'simple_raing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///[RateCustom] widget for create custom rating
///[displayName] name display befor rating
///[degree] current degree
///[ratingDegree] number of star
///[when user click on star for rating]
// ignore: must_be_immutable
class RateCustom extends StatefulWidget {
  String? displayName;
  Color fontColor;
  double degree;
  int ratingDegree;
  bool showVertival;
  Future<String?> Function(int) onRating;

  // Future<bool> Function(bool , Visits) onChange;
  int minBadRate = 1;
  Function(bool) showBadEvaluationFiled;

  RateCustom({
    super.key,
    required this.displayName,
    required this.degree,
    required this.ratingDegree,
    required this.onRating,
    required this.fontColor,
    required this.showBadEvaluationFiled,
    required this.minBadRate,
    this.showVertival = false,
  });

  @override
  State<RateCustom> createState() => _RateCustomState();
}

class _RateCustomState extends State<RateCustom> {
  @override
  Widget build(BuildContext context) {
    return widget.showVertival
        ? Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextAutoSize(
                  text: widget.displayName!,
                  fontSize: 4.sp,
                  fontFamily: AppFonts.bold,
                  fontWeight: FontWeight.bold,
                  color: widget.fontColor,
                ),
                SizedBox(height: 4.h),
                Wrap(children: [
                  SimpleRating(
                    useHalfRating: false,
                    onChanged: (v) async {
                      var result = await widget.onRating(v.toInt());
                      setState(() {
                        widget.showBadEvaluationFiled(
                            v.toInt() == widget.minBadRate ? true : false);
                        if (result != null) {
                          widget.degree = v;
                        }
                      });
                    },
                    starCount: widget.ratingDegree,
                    rating: widget.degree,
                    size: 20.sp,
                    // color: AppColors.ratedStarColor,
                    borderColor: AppColors.opacity_1,
                    spacing: 0.0,
                  ),
                ]),
              ],
            ))
        : Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextAutoSize(
                  text: widget.displayName!,
                  fontSize: 10.sp,
                  fontFamily: AppFonts.regular,
                  height: 2,
                  color: widget.fontColor,
                ),
                SimpleRating(
                  useHalfRating: false,
                  onChanged: (v) async {
                    var result = await widget.onRating(v.toInt());
                    setState(() {
                      widget.showBadEvaluationFiled(
                          v.toInt() == widget.minBadRate ? true : false);
                      if (result != null) {
                        widget.degree = v;
                      }
                    });
                  },
                  starCount: widget.ratingDegree,
                  rating: widget.degree,
                  size: 20.sp,
                  // color: AppColors.ratedStarColor,
                  borderColor: AppColors.opacity_1,
                  spacing: 0.0,
                ),
              ],
            ),
          );
  }
}
