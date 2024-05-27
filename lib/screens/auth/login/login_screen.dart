import 'package:get/get_utils/get_utils.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/components/screen.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/button/button.dart';
import 'package:lahint/components/text_filed/text_filed_custom.dart';
import 'package:lahint/helper/validation_form.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login_data.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/LoginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  LoginData loginData = LoginData();

  @override
  void initState() {
    loginData.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      // isAuthScreen: true,
      // loading: loginData.loading,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
          child: Form(
            key: loginData.formKeyLogin,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // CustomText(
                //     text: AppWords.hello.tr, fontSize: 23.sp, fontFamily: AppFonts.medium),
                CustomImage(assetImg: AppImage.logo, height: 120.h),
                // SizedBox(height: .15.sh),
                // CustomText(
                //   text: AppWords.login_or_create.tr,
                //   fontSize: 15.sp,
                //   fontFamily: AppFonts.bold,
                //   color: AppColors.mainColor,
                // ),
                SizedBox(height: .05.sh),

                /* BlocBuilder<GenericCubit<CountryModel>,
                    GenericState<CountryModel>>(
                  bloc: loginData.selectedCountry,
                  builder: (context, state) {
                    return */
                CustomTextField(
                  controller: loginData.phoneNumber,
                  hintText: "966123456789+",
                  labelText: AppWords.phonenumber.tr,
                  maxLength: 12,
                  hintFontSize: 16.sp,
                  focusedBorderColor: AppColors.lightGrey,
                  inputType: TextInputType.number,
                  textFieldVaidType: TextFieldValidatorType.PhoneNumber,
                  prefixIcon: AppImage.call,
                  // textDirection: TextDirection.ltr,
                  // suffix: Container(
                  //   width: .3.sw,
                  //   padding: const EdgeInsets.symmetric(vertical: 20),
                  //   margin: EdgeInsets.only(right: isArabic ? 8 : 0),
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: AppColors.greyLight),
                  //       borderRadius: BorderRadius.horizontal(
                  //           left: Radius.circular(isArabic ? 12 : 0),
                  //           right: Radius.circular(isArabic ? 0 : 12))),
                  //   child: PopupMenuButton(
                  //       onSelected: (value) {},
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(12)),
                  //       position: PopupMenuPosition.under,
                  //       padding: EdgeInsets.zero,
                  //       itemBuilder: (ctx) => List.generate(
                  //             loginData.countries.length,
                  //             (index) => PopupMenuItem(
                  //               height: 4,
                  //               onTap: () => loginData.selectCountry(index),
                  //               value: loginData.countries[index],
                  //               child: Column(
                  //                 crossAxisAlignment:
                  //                     CrossAxisAlignment.start,
                  //                 children: [
                  //                   Row(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.center,
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.center,
                  //                     children: [
                  //                       CustomText(
                  //                         text:
                  //                             '${loginData.countries[index].countryCode} +',
                  //                         fontSize: 18.sp,
                  //                         color: AppColors.greyB5B7BC,
                  //                       ),
                  //                       const SizedBox(width: 8),
                  //                       CustomText(
                  //                         text: loginData
                  //                             .countries[index].countryFlag,
                  //                         fontSize: 20.sp,
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   /*CustomText(
                  //                     text: loginData
                  //                         .countries[index].countryName,
                  //                     fontSize: 12.sp,
                  //                     color: AppColors.black,
                  //                   ),*/
                  //                   const SizedBox(height: 4),
                  //                   if (index + 1 !=
                  //                       loginData.countries.length) ...[
                  //                     const Padding(
                  //                       padding: EdgeInsets.symmetric(
                  //                           vertical: 8.0),
                  //                       child: Divider(
                  //                         color: AppColors.greyEEEEEE,
                  //                         height: 1,
                  //                         thickness: 1,
                  //                       ),
                  //                     ),
                  //                   ]
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //       child: Row(
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           CustomText(
                  //             text: '${state.data!.countryCode} +',
                  //             fontSize: 18.sp,
                  //             color: AppColors.greyB5B7BC,
                  //           ),
                  //           const SizedBox(width: 4),
                  //           const Icon(
                  //             Icons.keyboard_arrow_down,
                  //             color: AppColors.greyB0B0B0,
                  //           ),
                  //           const SizedBox(width: 4),
                  //           CustomText(
                  //             text: state.data!.countryFlag,
                  //             fontSize: 20.sp,
                  //           ),
                  //         ],
                  //       )),
                  // ),
                ),
                /*;
                  },
                ),*/
                // SizedBox(height: 4.h),
                // CustomTextField(
                //   controller: BlocProvider.of<UserCubit>(context, listen: false)
                //       .password,
                //   hintText: LLogin.password.tr,
                //   labelText: '',
                //   hintFontSize: 16.sp,
                //   prefixIcon: AppImage.password,
                //   obscureText: true,
                //   inputType: TextInputType.text,
                //   textFieldVaidType: TextFieldValidatorType.Password,
                // ),
                // SizedBox(height: 4.h),
                /// forget password
                /* Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () =>
                        goToScreen(screenNames: ScreenNames.forgetPassStepOne),
                    child: CustomText(
                      text: LLogin.forget.tr,
                      color: AppColors.secondaryColor,
                      fontFamily: AppFonts.regular,
                      fontSize: 16.sp,
                    ),
                  ),
                ),*/
                SizedBox(height: 16.h),
                CustomButton(
                  text: GlobalWords.send.tr,
                  fontFamily: AppFonts.bold,
                  loading: loginData.loading,
                  onPressed: () => loginData.userLogin(),
                ),
                SizedBox(height: .2.sh),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      goToScreenPushNamedAndpop(
                          screenNames: ScreenNames.homeScreen);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "استكشف التطبيق",
                          fontSize: 14.sp,
                          fontFamily: AppFonts.bold,
                          // fontWeight: AppFonts.w700,
                          color: AppColors.mainColor,
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.arrow_forward,
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                // CustomButton(
                //   width: 0.45.sw,
                //   isSecondButton: true,
                //   text: LLogin.new_account.tr,
                //   onPressed: () => goToScreen(screenNames: ScreenNames.signUp),
                // ),
                // SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
