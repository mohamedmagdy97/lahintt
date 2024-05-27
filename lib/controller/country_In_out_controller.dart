import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lahint/utility/app_setting.dart';

class CountryInOutController {
  getCurrentCountry() async {
    /// for live
    final List<Locale> systemLocales = WidgetsBinding.instance.window.locales;
    String? countryCode = systemLocales.first.countryCode;
    if (countryCode != null) {
      globalCountry = countryCode.toString();
      return countryCode;
    } else {
      /// for test
      http.Response result = await http.get(
        Uri.parse("http://ip-api.com/json"),
      );
      globalCountry =
          json.decode(result.body.toString())["countryCode"] ?? "KSA";
      return json.decode(result.body.toString())["countryCode"];
    }
  }
}
