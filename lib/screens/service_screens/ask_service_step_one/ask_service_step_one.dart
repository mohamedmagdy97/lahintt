import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lahint/components/button/button.dart';
import 'package:lahint/components/custom_app_bar/custom_app_bar.dart';
import 'package:lahint/components/custom_steper.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/screens/service_screens/ask_service_step_one/ask_service_step_one_data.dart';
import 'package:lahint/utility/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahint/components/radio_option/custom_radio_option.dart';
import 'package:lahint/components/text_filed/text_filed_custom.dart';
import 'package:lahint/cubits/generic_cubit/generic_cubit.dart';
import 'package:lahint/helper/validation_form.dart';
import 'package:lahint/utility/all_app_words.dart';

class AskServiceStepOneScreen extends StatefulWidget {
  static String routeName = '/AskServiceStepOneScreen';

  const AskServiceStepOneScreen({
    super.key,
  });

  @override
  State<AskServiceStepOneScreen> createState() =>
      _AskServiceStepOneScreenState();
}

class _AskServiceStepOneScreenState extends State<AskServiceStepOneScreen> {
  AskServiceStepOneScreenData askServiceStepOneScreenData =
      AskServiceStepOneScreenData();

  @override
  void initState() {
    askServiceStepOneScreenData.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(textAppBar: "", showBack: true),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          text: GlobalWords.next.tr,
          onPressed: () {
            goToScreen(screenNames: ScreenNames.askServiceStepTwoScreen);
          },
        ),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        padding: const EdgeInsets.all(16),
        children: [
          const CustomStepper(title: "أسئلة الخدمة", step: 1),
          CustomTextField(
            controller: askServiceStepOneScreenData.titleController,
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
            controller: askServiceStepOneScreenData.titleController,
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
            bloc: askServiceStepOneScreenData.suggestItemCubit,
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
                      onChanged: (v) => askServiceStepOneScreenData.selectItem(
                          index, state.data![index].id)),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: askServiceStepOneScreenData.detailsController,
            labelText: 'رسالة',
            hintText: 'رسالتك',
            maxLines: 5,
            // fillColor: AppColors.lightGrey,
            fillBorderColor: AppColors.lightGrey,
            inputType: TextInputType.text,
            textColor: AppColors.black,
            textFieldVaidType: TextFieldValidatorType.NormalText,
          ),
        ],
      ),
    );
  }
}
