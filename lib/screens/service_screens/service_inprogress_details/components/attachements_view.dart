import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/components/radio_option/custom_radio_option.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/text_filed/text_filed_custom.dart';
import 'package:lahint/cubits/generic_cubit/generic_cubit.dart';
import 'package:lahint/helper/validation_form.dart';
import 'package:lahint/screens/service_screens/service_inprogress_details/service_inprogress_details_data.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';

class AttachmentsView extends StatelessWidget {
  final ServiceInProgressDetailsData serviceInProgressDetailsData;

  const AttachmentsView({
    super.key,
    required this.serviceInProgressDetailsData,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: serviceInProgressDetailsData.titleController,
          labelText: "سؤال الخدمة 1",
          hintText: 'الاجابة',
          maxLines: null,
          fillColor: AppColors.lightGrey,
          fillBorderColor: Colors.transparent,
          inputType: TextInputType.text,
          textColor: AppColors.black,
          textFieldVaidType: TextFieldValidatorType.NormalText,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: serviceInProgressDetailsData.titleController,
          labelText: "سؤال الخدمة 2",
          hintText: 'الاجابة',
          maxLines: null,
          fillColor: AppColors.lightGrey,
          fillBorderColor: Colors.transparent,
          inputType: TextInputType.text,
          textColor: AppColors.black,
          textFieldVaidType: TextFieldValidatorType.NormalText,
        ),
        const SizedBox(height: 16),

        CustomText(
          text: 'سؤال الخدمة 3',
          fontSize: 14.sp,
          fontFamily: AppFonts.medium,
        ),
        const SizedBox(height: 16),
        BlocBuilder<GenericCubit<List<SuggestItem>>,
            GenericState<List<SuggestItem>>>(
          bloc: serviceInProgressDetailsData.suggestItemCubit,
          builder: (context, state) {
            return Row(
              children: List.generate(
                2,
                (index) => CustomRadioOption(
                    value: state.data![index].id,
                    groupValue: state.data![index].isSelected,
                    labelWidget: CustomText(
                      text: state.data![index].title,
                      fontSize: 14,
                    ),
                    onChanged: (v) => serviceInProgressDetailsData.selectItem(
                        index, state.data![index].id)),
              ),
            );
          },
        ),
        const SizedBox(height: 16),

        CustomTextField(
          controller: serviceInProgressDetailsData.detailsController,
          labelText: 'رسالة',
          hintText: 'رسالتك',
          maxLines: 5,
          fillColor: AppColors.lightGrey,
          fillBorderColor: Colors.transparent,
          inputType: TextInputType.text,
          textColor: AppColors.black,
          textFieldVaidType: TextFieldValidatorType.NormalText,
        ),
        // const SizedBox(height: 16),
        const SizedBox(height: 52),

        CustomText(
          text: "الاوراق المطلوبة",
          fontSize: 22,
          fontFamily: AppFonts.bold,
        ),
        const SizedBox(height: 18),
        ...List.generate(
          2,
          (index) => Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                const CustomImage(
                  assetImg: AppImage.jpg,
                  height: 40,
                  width: 32,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "صورة الرقم التأميني للمنشأة",
                      fontSize: 18,
                      fontFamily: AppFonts.bold,
                    ),
                    const SizedBox(height: 8),
                    CustomText(
                      text: ".JPG",
                      fontSize: 14,
                      color: AppColors.grey,
                      fontFamily: AppFonts.bold,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
