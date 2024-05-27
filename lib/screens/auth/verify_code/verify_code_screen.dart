import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lahint/components/button/button.dart';
import 'package:lahint/components/screen.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/screens/auth/verify_code/verify_code_data.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerifyCode extends StatefulWidget {
  static String routeName = '/verifyCode';

  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeScreen();
}

class _VerifyCodeScreen extends State<VerifyCode> {
  VerifyCodeData verifyCodeData = VerifyCodeData();

  @override
  void initState() {
    verifyCodeData.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    verifyCodeData.initData();
    return Screen(
      isAuthScreen: true,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 36.h),
        children: [
          Column(
            children: [
              CustomText(
                  text: AppWords.enter_code.tr,
                  fontSize: 23.sp,
                  fontFamily: AppFonts.medium),
              SizedBox(height: .1.sh),
              CustomText(
                text: AppWords.check_code.tr,
                fontSize: 16.sp,
                fontFamily: AppFonts.bold,
                color: AppColors.greyB6B6B6,
              ),
              const SizedBox(height: 8),
              CustomText(
                text: verifyCodeData.phone.toString(),
                fontSize: 16.sp,
                fontFamily: AppFonts.bold,
                color: AppColors.darkColor,
              ),
              SizedBox(height: .05.sh),
              // SizedBox(height: 24.h),
              /* CustomTextAutoSize(
                  text: LLogin.verify_btn.tr,
                  color: AppColors.secondaryColor,
                  fontSize: 20.sp,
                  fontWeight: AppFonts.w700,
                  fontFamily: AppFonts.bold),
              Text(
                "${LLogin.verify_header1.tr}  \n${verifyCodeData.verify!.phoneNumber!}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 18.sp,
                  fontWeight: AppFonts.w700,
                  fontFamily: AppFonts.bold,
                ),
              ),
              SizedBox(height: 14.h),*/
              SizedBox(
                height: 68.h,
                child: PinFieldAutoFill(
                  controller: verifyCodeData.verifyResult,
                  codeLength: 4,
                  // currentCode: "----",

                  decoration: BoxLooseDecoration(
                    hintText: "----",
                    radius: Radius.circular(6.r),
                    strokeWidth: 1,
                    bgColorBuilder:
                        const FixedColorBuilder(AppColors.lightGrey),
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: AppFonts.bold,
                      fontWeight: AppFonts.w700,
                      color: AppColors.textColor,
                    ),
                    strokeColorBuilder:
                        const FixedColorBuilder(AppColors.lightGrey),
                  ),
                  cursor: Cursor(
                    width: 2.w,
                    height: 20.h,
                    color: AppColors.mainColor,
                    radius: Radius.circular(1.r),
                    enabled: true,
                  ),
                  autoFocus: false,
                  onCodeChanged: (code) {},
                  onCodeSubmitted: (code) {},
                ),
              ),
              SizedBox(height: 30.h),
              CustomButton(
                width: 0.45.sw,
                text: GlobalWords.next.tr,
                loading: verifyCodeData.loading,
                onPressed: () => verifyCodeData.onBtnVerifyCodeTap(),
              ),
              SizedBox(height: 20.h),
              // CustomText(
              //   text: AppWords.not_send.tr,
              //   fontSize: 15.sp,
              //   fontFamily: AppFonts.bold,
              //   color: AppColors.grey666666,
              // ),
              // SizedBox(height: 12.h),
              BlocBuilder(
                bloc: verifyCodeData.duration,
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: verifyCodeData.duration.state.data?.inSeconds ==
                                0
                            ? () {
                                // verifyCodeData.onBtnReGenerateCodeTap();
                                verifyCodeData.duration
                                    .update(data: const Duration(seconds: 60));
                                verifyCodeData.startTimer();
                              }
                            : null,
                        child: Text(
                          verifyCodeData.duration.state.data?.inSeconds == 0
                              ? AppWords.re_send.tr
                              : AppWords.re_send_after.tr,
                          //  LLogin.verify_header2.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color:
                                verifyCodeData.duration.state.data?.inSeconds ==
                                        0
                                    ? AppColors.darkColor
                                    : AppColors.grey666666,
                            fontSize: 15.sp,
                            fontFamily:
                                verifyCodeData.duration.state.data?.inSeconds ==
                                        0
                                    ? AppFonts.bold
                                    : AppFonts.medium,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      if (verifyCodeData.duration.state.data?.inSeconds != 0)
                        Text(
                          '00:${verifyCodeData.duration.state.data!.inSeconds > 9 ? verifyCodeData.duration.state.data!.inSeconds : '0${verifyCodeData.duration.state.data!.abs().inSeconds}'}',
                          style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 14.sp,
                              // height: 2.8,
                              fontFamily: AppFonts.regular,
                              fontWeight: AppFonts.w400),
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
