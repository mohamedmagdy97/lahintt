import 'package:flutter/services.dart';
import 'package:lahint/my_app.dart';
import 'package:flutter/material.dart';
import 'controller/country_In_out_controller.dart';
import 'helper/lang.dart';
import 'utility/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.bgNavBar,
    statusBarColor: AppColors.bgNavBar,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));

  Locale localLang = await Lang.getDefaultOrStoredLocal();

  await CountryInOutController().getCurrentCountry();
  runApp(MyApp(currentLocale: localLang));
}
