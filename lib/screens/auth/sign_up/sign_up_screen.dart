import 'package:get/get.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/button/button.dart';
import 'package:lahint/components/screen.dart';
import 'package:lahint/components/text_filed/text_filed_custom.dart';
import 'package:lahint/screens/auth/sign_up/sign_up_data.dart';
import 'package:lahint/screens/general_data/general_data.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';
import 'package:lahint/helper/validation_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  static String routeName = '/SignUp';

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpFirstStep();
}

class _SignUpFirstStep extends State<SignUp> {
  SignUpData signUpData = SignUpData();

  @override
  void initState() {
    signUpData.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      isAuthScreen: true,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 36.h),
        children: [
          Form(
            key: signUpData.formKeyFirst,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: .1.sh),
                CustomText(
                  text: AppWords.personal_info.tr,
                  fontSize: 23.sp,
                  fontFamily: AppFonts.medium,
                ),
                SizedBox(height: 30.h),
                /* CustomTextField(
                    controller: signUpData.phoneNumber,
                    hintText: LLogin.phonenumber.tr,
                    maxLength: 10,
                    labelText: '',
                    inputType: TextInputType.number,
                    prefixIcon: AppImage.name1,
                    textFieldVaidType: TextFieldValidatorType.PhoneNumber,
                  ),
                  SizedBox(height: 16.h),*/
                CustomTextField(
                  controller: signUpData.name,
                  hintText: AppWords.first_name.tr,
                  labelText: AppWords.first_name.tr,
                  prefixIcon: AppImage.name,
                  inputType: TextInputType.text,
                  textFieldVaidType: TextFieldValidatorType.Name,
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  controller: signUpData.phoneNumber,
                  hintText: AppWords.phonenumber.tr,
                  maxLength: 12,
                  labelText: AppWords.phonenumber.tr,
                  prefixIcon: AppImage.call,
                  isDisable: generalData.mobile!.isNotEmpty,
                  inputType: TextInputType.number,
                  textFieldVaidType: TextFieldValidatorType.PhoneNumberSelected,
                ),
                SizedBox(height: 8.h),

                SizedBox(height: 32.h),
                CustomButton(
                  width: 0.55.sw,
                  loading: signUpData.loading,
                  text: "ابدآ الان", //AppWords.create_account.tr,
                  onPressed: () => signUpData.userRegister(context),
                ),
                SizedBox(height: 20.h),

              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    signUpData.name.dispose();
    // signUpData.mName.dispose();
    // signUpData.lName.dispose();
    signUpData.phoneNumber.dispose();
    // signUpData.password.dispose();
    // signUpData.confirmPassword.dispose();
    super.dispose();
  }
}
