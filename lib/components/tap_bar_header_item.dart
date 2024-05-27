import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahint/cubits/generic_cubit/generic_cubit.dart';
import 'package:lahint/utility/app_theme.dart';

class TapBarHeaderItem extends StatelessWidget {
  final TabController tabController;

  final List<String> tabsTitle;

  const TapBarHeaderItem(
      {super.key, required this.tabController, required this.tabsTitle});

  @override
  Widget build(BuildContext context) {
    GenericCubit<int> indexCubit = GenericCubit(data: 0);
    return Container(
      margin: const EdgeInsets.all(8),
      child: TabBar(
        controller: tabController,
        padding: const EdgeInsets.all(4),
        indicatorColor: AppColors.mainColor,
        labelColor: AppColors.mainColor,
        unselectedLabelColor: AppColors.grey,
        splashBorderRadius: BorderRadius.circular(12),
        unselectedLabelStyle: TextStyle(
          fontSize: 16.sp,
          fontFamily: AppFonts.medium,
          color: AppColors.grey,
        ),
        labelStyle: TextStyle(
            fontSize: 16.sp,
            color: AppColors.mainColor,
            fontFamily: AppFonts.bold),
        onTap: (i) {
          indexCubit.update(data: i);
        },
        tabs: <Widget>[
          for (int i = 0; i < tabsTitle.length; i++) Tab(text: tabsTitle[i])
        ],
      ),
    );
  }
}
