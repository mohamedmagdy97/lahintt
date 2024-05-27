import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lahint/components/alert/custom_alert_message.dart';
import 'package:lahint/cubits/custom_items_cubits/loading_cubit/loading_cubit.dart';
import 'package:lahint/cubits/generic_cubit/generic_cubit.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/screens/general_data/general_data.dart';
import 'package:lahint/utility/all_app_words.dart';

class VerifyCodeData {
  Timer? countdownTimer;
  GenericCubit<Duration> duration =
      GenericCubit<Duration>(data: const Duration(seconds: 60));

  TextEditingController verifyResult = TextEditingController();
  final Loading loading = Loading();


  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    countdownTimer?.cancel();
  }

  void setCountDown() async {
    final seconds = duration.state.data!.inSeconds - 1;
    await Future.delayed(const Duration(milliseconds: 350));
    if (seconds < 0) {
      stopTimer();
    } else {
      duration.update(data: Duration(seconds: seconds));
    }
  }

  String? phone;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  initData() {
    startTimer();
    phone = Get.arguments;
  }

  /// Verify Login TWO FACTOR AUTH
  onBtnVerifyCodeTap() async {
    if (verifyResult.text.isNotEmpty && verifyResult.text.length >= 4) {
      generalData.mobile = phone;
      goToScreen(screenNames: ScreenNames.signUp);
    } else {
      customAlertMessage(
          txt: GlobalWords.error_code.tr,
          alertType: AlertType.error.tr,
          onClick: () => goBack());
    }
  }
}
