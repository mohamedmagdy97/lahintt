import 'package:lahint/utility/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeLine extends StatelessWidget {
  final int number;
  final int activeNumber ;
  const TimeLine({Key? key ,required this.number ,required this.activeNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      var dots = Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 8.w,),
          Container(
            width: 6.w, height: 6.h,
            decoration: BoxDecoration(
              color: Colors.white60.withOpacity(.2),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 8.w,),
          Container(
            width: 6.w, height: 6.h,
            decoration: BoxDecoration(
              color: Colors.white60.withOpacity(.2),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 8.w,),
          Container(
            width: 6.w, height: 6.h,
            decoration: BoxDecoration(
              color: Colors.white60.withOpacity(.2),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 5,),
        ],
      );
      List<Widget> itemList = [];
      for (var i = 1; i <= number; i++) {
        var numbers = Container(
          padding: EdgeInsets.all(3.h),
          width: 43.w,
          height: 43.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: i == activeNumber ? AppColors.green : activeNumber > i
                    ? AppColors.green
                    : Colors.white60.withOpacity(.2)),
          ),
          child: Container(
              width: 55.w,
              height: 55.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: i == activeNumber ? AppColors.green : activeNumber > i
                    ? AppColors.green
                    : Colors.white60.withOpacity(.2),
              ),
              child: Center(
                child: i == activeNumber ? Text(
                  "0$i",
                  style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ) : activeNumber > i ? Icon(
                  Icons.check, color: AppColors.white, size: 20.sp,) : Text(
                  "0$i",
                  style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),

              ),
              ),
        );
        itemList.add(numbers);
        if (i != number) {
          itemList.add(dots);
        }
      }
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: itemList,
      ),
    );
  }
}