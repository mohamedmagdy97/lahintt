import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahint/utility/app_theme.dart';

typedef RatingChangeCallback = void Function(double rating);

/// Simple Rating
class SimpleRating extends StatelessWidget {
  final RatingIcon icons;
  final int starCount;
  final double rating;
  final RatingChangeCallback? onChanged;
  final Color? color;
  final Color? borderColor;
  final double? size;
  final bool useHalfRating;
  final double spacing;

  const SimpleRating(
      {super.key,
      this.icons = const RatingIcon(),
      this.starCount = 5,
      this.rating = 0.0,
      this.onChanged,
      this.color,
      this.borderColor,
      this.size,
      this.spacing = 0.0,
      this.useHalfRating = true});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star,
        color: borderColor ?? AppColors.orangeF8A500,
        size: size ?? 25.sp,
      );
    } else if (rating.toInt() >= index + 1) {
      icon = Icon(
        Icons.star,
        color: color ?? AppColors.orangeF8A500,
        size: size ?? 25.sp,
      );
    } else {
      icon = Icon(
        Icons.star_half,
        color: color ?? AppColors.orangeF8A500,
        size: size ?? 25.sp,
      );
    }

    return GestureDetector(
      onTap: () {
        if (onChanged != null) onChanged!(index + 1.0);
      },
      child: icon,
    );
  }

  // double _customRound(double val) {
  //   if (val <= 0) {
  //     return 0;
  //   }

  //   final int intVal = val.toInt();
  //   double tempVal = val - intVal;
  //   if (tempVal < 0.5) {
  //     return intVal.toDouble() + 0.5;
  //   } else {
  //     return (intVal + 1).toDouble();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Wrap(
          alignment: WrapAlignment.start,
          spacing: spacing,
          children:
              List.generate(starCount, (index) => buildStar(context, index))),
    );
  }
}

/// Rating Icon
class RatingIcon {
  final IconData? emptyIcon;
  final IconData? halfIcon;
  final IconData? fullIcon;

  const RatingIcon({this.emptyIcon, this.halfIcon, this.fullIcon});
}
