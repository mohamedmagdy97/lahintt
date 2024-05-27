import 'package:flutter/material.dart';
import 'package:lahint/cubits/custom_items_cubits/loading_cubit/loading_cubit.dart';
import 'package:lahint/cubits/generic_cubit/generic_cubit.dart';
 import 'package:lahint/routes/routes.dart';
import 'package:lahint/screens/general_data/general_data.dart';

class SignUpData {
  final formKeyFirst = GlobalKey<FormState>();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController inviteCode = TextEditingController();
  Loading loading = Loading();
  final TextEditingController verifyResult = TextEditingController();

  GenericCubit<bool> termsCubit = GenericCubit(data: false);

  init() {
    phoneNumber.text = generalData.mobile ?? "";
  }

  userRegister(BuildContext context) async {
    if (!formKeyFirst.currentState!.validate()) {
      return;
    }
    goToWithRemoveRoute(screenNames: ScreenNames.homeScreen);
    return;
  }
}
