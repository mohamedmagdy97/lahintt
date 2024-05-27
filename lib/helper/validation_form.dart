// ignore_for_file: constant_identifier_names

import 'package:get/get_utils/get_utils.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/reg_exp.dart';

import 'arabic_to_english_number.dart';

enum TextFieldValidatorType {
  Email,
  RegisterEmail,
  Password,
  ConfirmPassword,
  PhoneNumber,
  PhoneNumberSelected,
  HouseNumber,
  NormalText,
  Code,
  Number,
  Name,
  DisplayText,
  Optional,
}

validation(
    {required TextFieldValidatorType type,
    required String value,
    required String firstPasswordForConfirm}) {
  if (type == TextFieldValidatorType.PhoneNumber) {
    if (value.isEmpty) {
      return HourlyTR.field_required.tr;
    } else if (!regExpNumber.hasMatch(value.arabicNumberToEnglish)) {
      return HourlyTR.number_incorrect.tr;
    }
    return null;
  } else if (type == TextFieldValidatorType.PhoneNumberSelected) {
    if (value.isEmpty) {
      return HourlyTR.field_required.tr;
    } else if (!regExpNumberSelected.hasMatch(value.arabicNumberToEnglish)) {
      return HourlyTR.number_incorrect.tr;
    }
    return null;
  } else if (type == TextFieldValidatorType.Email) {
    if (value.isEmpty) {
      return HourlyTR.field_required.tr;
    } else if (!regExpEmail.hasMatch(value)) {
      return HourlyTR.email_invalid.tr;
    } else {
      return null;
    }
  } else if (type == TextFieldValidatorType.RegisterEmail) {
    if (value.isEmpty) {
      return;
    } else if (!regExpEmail.hasMatch(value)) {
      return HourlyTR.email_invalid.tr;
    } else {
      return null;
    }
  } else if (type == TextFieldValidatorType.Password) {
    if (value.isEmpty) {
      return HourlyTR.must_password.tr;
    } else if (value.length < 6) {
      return HourlyTR.pass_least_six_char.tr;
    } else if (value.length > 30) {
      return HourlyTR.pass_must_not_execeed_30.tr;
    } else {
      return null;
    }
  } else if (type == TextFieldValidatorType.ConfirmPassword) {
    if (value.isEmpty) {
      return HourlyTR.field_required.tr;
    } else if (value != firstPasswordForConfirm) {
      return HourlyTR.not_matching.tr;
    } else {
      return null;
    }
  } else if (type == TextFieldValidatorType.Code) {
    if (value.isEmpty) {
      return HourlyTR.field_required.tr;
    }
  } else if (type == TextFieldValidatorType.Optional) {
    return null;
  } else if (type == TextFieldValidatorType.Number) {
    if (value.isEmpty) {
      return HourlyTR.field_required.tr;
    } else if (!numberRegex.hasMatch(value.arabicNumberToEnglish)) {
      return HourlyTR.number_incorrect.tr;
    }
  } else if (type == TextFieldValidatorType.DisplayText) {
    if (value.isEmpty) {
      return HourlyTR.field_required.tr;
    }
    if (value.length < 2) {
      return GlobalWords.short_text.tr;
    }
  } else if (type == TextFieldValidatorType.Name) {
    if (value.isEmpty) {
      return HourlyTR.field_required.tr;
    }
    if (value.length < 2) {
      return GlobalWords.short_text.tr;
    }
    if (value.length > 20) {
      return GlobalWords.long_text.tr;
    }

    if (!regExpName.hasMatch(value.trim().replaceAll('‎', ''))) {
      return HourlyTR.not_contain_spechial_char.tr;
    }

    return null;
  } else {
    if (value.isEmpty) {
      return HourlyTR.field_required.tr;
    }
    if (value.length < 2) {
      return GlobalWords.short_text.tr;
    }

    return null;
  }
}
