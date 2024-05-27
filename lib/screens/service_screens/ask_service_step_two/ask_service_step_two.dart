import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lahint/components/button/button.dart';
import 'package:lahint/components/custom_app_bar/custom_app_bar.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/components/custom_steper.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/screens/service_screens/ask_service_step_two/ask_service_step_two_data.dart';
import 'package:lahint/utility/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahint/cubits/generic_cubit/generic_cubit.dart';
import 'package:lahint/utility/all_app_words.dart';

class AskServiceStepTwoScreen extends StatefulWidget {
  static String routeName = '/AskServiceStepTwoScreen';

  const AskServiceStepTwoScreen({
    super.key,
  });

  @override
  State<AskServiceStepTwoScreen> createState() =>
      _AskServiceStepTwoScreenState();
}

class _AskServiceStepTwoScreenState extends State<AskServiceStepTwoScreen> {
  AskServiceStepTwoScreenData askServiceStepTwoScreenData =
      AskServiceStepTwoScreenData();

  @override
  void initState() {
    askServiceStepTwoScreenData.init();
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
            goToScreen(screenNames: ScreenNames.askServiceStepThreeScreen);
          },
        ),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        padding: const EdgeInsets.all(16),
        children: [
          const CustomStepper(title: "الأوراق المطلوبة", step: 2),
          ...List.generate(
            4,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "الرقم المميز للمنشأة",
                    fontSize: 14,
                    fontFamily: AppFonts.bold,
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<GenericCubit<File>, GenericState<File?>>(
                    bloc: askServiceStepTwoScreenData.imageCubit,
                    builder: (context, state) {
                      return InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: Get.context!,
                              constraints: BoxConstraints(maxHeight: 0.85.sh),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16))),
                              isScrollControlled: true,
                              useSafeArea: true,
                              builder: (context) => SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 32.0, horizontal: 16),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 16),
                                      InkWell(
                                        onTap: () {
                                          askServiceStepTwoScreenData
                                              .uploadImageCamera();

                                          Navigator.pop(Get.context!);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 12),
                                          decoration: BoxDecoration(
                                            color: AppColors.greyF3F3F3,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Row(
                                            children: [
                                              const CustomImage(
                                                assetImg: AppImage.camera,
                                                height: 24,
                                                width: 24,
                                              ),
                                              const SizedBox(width: 12),
                                              CustomText(
                                                text: "استخدم الكاميرا",
                                                fontSize: 16.sp,
                                                fontFamily: AppFonts.medium,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      InkWell(
                                        onTap: () {
                                          askServiceStepTwoScreenData
                                              .uploadImageFiles();
                                          Navigator.pop(Get.context!);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 12),
                                          decoration: BoxDecoration(
                                            color: AppColors.greyF3F3F3,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Row(
                                            children: [
                                              const CustomImage(
                                                assetImg: AppImage.upload,
                                                height: 24,
                                                width: 24,
                                              ),
                                              const SizedBox(width: 12),
                                              CustomText(
                                                text: "من جهازك",
                                                fontSize: 16.sp,
                                                fontFamily: AppFonts.medium,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: state.data != null
                              ? SizedBox(
                                  height: 120,
                                  width: 1.sw,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.file(state.data!,
                                        fit: BoxFit.cover),
                                  ),
                                )
                              : const CustomImage(assetImg: AppImage.add_file));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
