import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lahint/components/Text/custom_text.dart';
import 'package:lahint/components/button/button.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/components/text_filed/text_filed_custom.dart';
import 'package:lahint/cubits/generic_cubit/generic_cubit.dart';
import 'package:lahint/helper/validation_form.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/screens/home/tabs/home/home_data.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';
import 'package:lahint/utility/utilities.dart';

class RatingBottomSheet extends StatelessWidget {
  const RatingBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
              CustomText(
                text: 'قيم الخدمة',
                fontSize: 24.sp,
                fontFamily: AppFonts.heavy,
              ),
              const SizedBox(height: 8),
              CustomText(
                text:
                    'يسعدنا استلام ملاحظاتك التي تساعدنا لتحسي الخدمة وتطوير تجربة الاستخدام',
                // 'برجر كنج Burger King',
                fontSize: 14.sp,
                fontFamily: AppFonts.regular,
                color: AppColors.grey,
              ),
              const SizedBox(height: 12),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const CustomImage(
                  assetImg: AppImage.services,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  // if (index == 0) {
                  //   homeData.rateDeliveryCubit.update(data: rating);
                  // } else if (index == 1) {}
                  // homeData.rateStoreCubit.update(data: rating);
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: TextEditingController(),
                labelText: 'اكتب شيئاً (اختياري)',
                hintText: 'مثلا: يمكنكم تحسين ...',
                maxLines: 3,
                fillColor: AppColors.lightGrey,
                fillBorderColor: Colors.transparent,
                inputType: TextInputType.text,
                textColor: AppColors.black,
                textFieldVaidType: TextFieldValidatorType.NormalText,
              ),
              const SizedBox(height: 16),
            ],
          ),
          const SizedBox(height: 8),
          BlocBuilder<GenericCubit<int>, GenericState<int>>(
            bloc: homeData.currentPageCubit,
            builder: (context, state) {
              return Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    // width: .3.sw,
                    height: 40,
                    text: GlobalWords.send.tr,
                    onPressed: () async {
                      if (state.data! == 0) {
                        if (homeData.rateDeliveryCubit.state.data != 0.0) {
                          await homeData.rateDelivery();
                        } else {
                          Utilities().customSnackBarTerms(context,
                              txt: 'من فضلك ادخل التقييم');
                          return;
                        }
                      } else if (state.data! == 1) {
                        if (homeData.rateStoreCubit.state.data != 0.0) {
                          await homeData.rateStore();
                        } else {
                          Utilities().customSnackBarTerms(context,
                              txt: 'من فضلك ادخل التقييم');
                          return;
                        }
                      }

                      if (state.data! != 1) {
                        homeData.controller.nextPage(
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeIn);
                      } else {
                        goBack();
                        homeData.currentPageCubit.update(data: 0);
                      }
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        /*if (state.data!.lastIndexOf(state
                            .data![introData.currentPageCubit.state.data!]) !=
                        state.data!.length - 1) {*/
                        /* if (rateList.lastIndexOf(rateList[
                            homeData.currentPageCubit.state.data!]) !=
                        rateList.length - 1) {*/
                        if (state.data! != 1) {
                          homeData.controller.nextPage(
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeIn);
                        } else {
                          goBack();
                          homeData.currentPageCubit.update(data: 0);
                        }
                      },
                      child: CustomText(
                        text: GlobalWords.back.tr,
                        fontSize: 16,
                        fontFamily: AppFonts.medium,
                        color: AppColors.mainColor,
                      )),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

class RateModel {
  RateModel({
    this.id,
    this.image,
    this.name,
    this.status,
    this.description,
    this.type,
    this.isLast = false,
    this.index = 0,
  });

  int? id;
  String? image;
  String? name;
  String? status;
  String? description;
  int? type;
  final bool? isLast;
  final int? index;
}
