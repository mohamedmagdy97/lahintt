import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lahint/components/button/button.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/components/screen.dart';
import 'package:lahint/components/text/custom_auto_size_text.dart';
import 'package:lahint/cubits/generic_cubit/generic_cubit.dart';
import 'package:lahint/helper/local_store.dart';
import 'package:lahint/models/ads_model.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/screens/home/components/dots_item.dart';
import 'package:lahint/screens/intro/components/intro_view.dart';
import 'package:lahint/screens/intro/intro_data.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';

class IntroScreen extends StatefulWidget {
  static String route = "IntroScreen";

  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  IntroData introData = IntroData();

  @override
  void initState() {
    introData.getInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      isAuthScreen: false,
      onTap: () {},
      child: BlocBuilder<GenericCubit<int>, GenericState<int>>(
        bloc: introData.currentPageCubit,
        builder: (context, statePage) {
          return BlocBuilder<GenericCubit<List<AdsModel>>,
              GenericState<List<AdsModel>>>(
            bloc: introData.adsCubit,
            builder: (context, state) {
              if (state.data != null) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 0.6.sh + 16,
                              width: 1.sw,
                              child: PageView(
                                controller: introData.controller,
                                onPageChanged: (i) =>
                                    introData.currentPageCubit.update(data: i),
                                physics: const NeverScrollableScrollPhysics(),
                                children: List.generate(
                                  state.data!.length,
                                  (index) => Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.center,
                                            transform:
                                                const GradientRotation(90),
                                            colors: [
                                              AppColors.white,
                                              AppColors.grey.withOpacity(0.1),
                                            ],
                                          ),
                                        ),
                                        child: IntroView(
                                          assetImg: state.data![index].image ??
                                              "http",
                                          txt1:
                                              state.data![index].description ??
                                                  "",
                                          index: index,
                                          isLast: state.data!.lastIndexOf(
                                                  state.data![index]) ==
                                              state.data!.length - 1,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16, bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(
                                            state.data!.length,
                                            (index) => DotsItems(
                                                index: index,
                                                currentPage: statePage.data!),
                                          ),
                                        ),
                                      ),
                                      CustomTextAutoSize(
                                        text:
                                            state.data![index].title.toString(),
                                        color: AppColors.mainColor,
                                        fontSize: 22.sp,
                                        fontFamily: AppFonts.bold,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CustomTextAutoSize(
                                          text: state.data![index].description
                                              .toString(),
                                          color: AppColors.mainColor,
                                          fontSize: 16.sp,
                                          fontFamily: AppFonts.bold,
                                        ),
                                      ),
                                      SizedBox(height: 0.015.sh),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            CustomButton(
                              text: GlobalWords.next.tr,
                              width: 0.75.sw,
                              onPressed: () {
                                if (state.data!.isEmpty) {
                                  goToScreenPushNamedAndpop(
                                      screenNames: ScreenNames.loginScreen);
                                  return;
                                }
                                if (state.data!.lastIndexOf(state.data![
                                        introData
                                            .currentPageCubit.state.data!]) !=
                                    state.data!.length - 1) {
                                  introData.controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 350),
                                      curve: Curves.easeIn);
                                } else {
                                  AppLocalStore.setBool(
                                      "userClickSplash", true);
                                  goToScreenPushNamedAndpop(
                                      screenNames: ScreenNames.loginScreen);
                                }
                              },
                            ),
                            if (state.data!.isNotEmpty)
                              if (state.data!.lastIndexOf(state.data![introData
                                      .currentPageCubit.state.data!]) !=
                                  state.data!.length - 1) ...[
                                const SizedBox(height: 16),
                                CustomButton(
                                  text: IndivL.skip.tr,
                                  width: 0.75.sw,
                                  isButtonBorder: true,
                                  colorFont: AppColors.mainColor,
                                  onPressed: () {
                                    AppLocalStore.setBool(
                                        "userClickSplash", true);
                                    goToScreenPushNamedAndpop(
                                        screenNames: ScreenNames.homeScreen);
                                  },
                                ),
                              ],
                            // SizedBox(height: 0.08.sh),

                            SizedBox(height: 0.1.sh),
                          ],
                        ),
                      ),
                    ),
                    if (introData.currentPageCubit.state.data != 0)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: IconButton(
                          onPressed: () {
                            introData.controller.previousPage(
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeOut,
                            );
                          },
                          icon: const CustomImage(assetImg: AppImage.back),
                        ),
                      ),
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          );
        },
      ),
    );
  }
}
