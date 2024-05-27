import 'package:flutter/material.dart';
import 'package:lahint/cubits/custom_items_cubits/loading_cubit/loading_cubit.dart';
import 'package:lahint/helper/arabic_to_english_number.dart';
import 'package:lahint/routes/routes.dart';

class LoginData {
  final formKeyLogin = GlobalKey<FormState>();

  final Loading loading = Loading();
  final TextEditingController phoneNumber = TextEditingController();

  init() {}

  userLogin() async {
    if (!formKeyLogin.currentState!.validate()) {
      return;
    }

    String phone = phoneNumber.text.arabicNumberToEnglish;
    goToScreen(screenNames: ScreenNames.verifyCodeScreen, arguments: phone);
  }
}
