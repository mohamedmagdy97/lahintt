import 'package:flutter/material.dart';
import 'package:lahint/cubits/generic_cubit/generic_cubit.dart';
import 'package:lahint/helper/lang.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/utility/app_setting.dart';

class LanguageData {
  GenericCubit<bool> langSwitchArabicCubit = GenericCubit(data: true);

  init() {
    langSwitchArabicCubit.update(data: isArabic);
  }

  changeLang({required String lang, bool fromHome = false}) async {
    if (lang != 'ar') {
      Lang.changeLang(const Locale("en"));
    } else {
      Lang.changeLang(const Locale("ar"));
    }
    goToWithRemoveRoute(screenNames: ScreenNames.splashScreen);
    return;
  }
}
