import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/cubits/generic_cubit/generic_cubit.dart';

import 'package:lahint/models/categery_model.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/screens/home/tabs/home/home_data.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "الخدمات",
                fontSize: 20.sp,
                fontFamily: AppFonts.bold,
              ),
              InkWell(
                onTap: () =>
                    goToScreen(screenNames: ScreenNames.allServicesScreen),
                child: CustomText(
                  text: HourlyTR.all.tr,
                  color: AppColors.mainColor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.mainColor,
                  fontSize: 12.sp,
                  fontFamily: AppFonts.medium,
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<GenericCubit<List<CategoryModel?>>,
            GenericState<List<CategoryModel?>>>(
          bloc: homeData.catsListCubit,
          builder: (context, state) {
            if (state.data != null) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // runSpacing: 16,
                    // spacing: 16,
                    // alignment: WrapAlignment.spaceAround,
                    children: List.generate(
                      state.data!.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () =>
                              homeData.onSelectCategory(state.data![index]!),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        // borderRadius: BorderRadius.circular(12),
                                        color: AppColors.bgAppBar),
                                    child: CustomImage(
                                      assetImg:
                                          state.data![index]!.image.toString(),
                                      borderRadius: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  CustomText(
                                    text: state.data![index]!.name.toString(),
                                    fontSize: 13.sp,
                                    fontFamily: AppFonts.bold,
                                  ),
                                  CustomText(
                                    text: state.data![index]!.describtion
                                        .toString(),
                                    fontSize: 13.sp,
                                    fontFamily: AppFonts.bold,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
