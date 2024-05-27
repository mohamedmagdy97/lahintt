import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahint/utility/app_theme.dart';

class CustomRadioOption<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Widget labelWidget;
  final ValueChanged<T> onChanged;

  const CustomRadioOption({
    super.key,
    required this.value,
    required this.groupValue,
    required this.labelWidget,
    required this.onChanged,
  });

  // Widget BuildCircle() {
  //   final bool isSelected = value == groupValue;
  //   return CircleAvatar(
  //     radius: 10.r,
  //     backgroundColor:
  //         isSelected ? AppColors.secondaryColorOne : AppColors.black.withOpacity(.2),
  //     child: CircleAvatar(
  //       radius: 8.r,
  //       backgroundColor: AppColors.white,
  //       child: CircleAvatar(
  //         radius: 5.5.r,
  //         backgroundColor: isSelected
  //             ? AppColors.secondaryColorOne
  //             : AppColors.black.withOpacity(.2),
  //       ),
  //     ),
  //   );
  // }
  Widget buildSelected() {
    final bool isSelected = value == groupValue;
    return  isSelected
        ? Container(
            decoration: const BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(5.sp)),
                shape: BoxShape.circle,
                color: AppColors.cardColor3),
            padding: const EdgeInsets.all(10),
          )
        : Container(
            decoration: const BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(5.sp)),
                shape: BoxShape.circle,
                color: AppColors.textBox),
            padding: const EdgeInsets.all(10),
            child: const SizedBox(),
          );
    // return CircleAvatar(
    //   radius: 10.r,
    //   backgroundColor:
    //   isSelected ? AppColors.secondaryColorOne : AppColors.black.withOpacity(.2),
    //   child: CircleAvatar(
    //     radius: 8.r,
    //     backgroundColor: AppColors.white,
    //     child: CircleAvatar(
    //       radius: 5.5.r,
    //       backgroundColor: isSelected
    //           ? AppColors.secondaryColorOne
    //           : AppColors.black.withOpacity(.2),
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      borderRadius: BorderRadius.all(Radius.circular(5.sp)),
      child: Padding(
        padding: EdgeInsets.all(5.h),
        child: Row(
          children: [buildSelected(), const SizedBox(width: 10), labelWidget],
        ),
      ),
    );
  }
}
