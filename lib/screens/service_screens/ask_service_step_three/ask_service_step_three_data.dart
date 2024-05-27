import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lahint/cubits/custom_items_cubits/loading_cubit/loading_cubit.dart';
import 'package:lahint/cubits/generic_cubit/generic_cubit.dart';
import 'package:lahint/helper/upload_image.dart';

class AskServiceStepThreeData {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Loading loading = Loading();

  init() {}

  sendComplaint() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    /* if (suggestItemCubit.state.data!
        .where((element) => element.isSelected.isNotEmpty)
        .toList()
        .isEmpty) {
      Utilities().customSnackBarTerms(Get.context!, txt: AppWords.chat_type_select.tr);
      return;
    }
    loading.show;
    var res = await GeneralController.makeComplaint(
        msg: detailsController.text,
        type: suggestItemCubit.state.data!
            .where((element) => element.isSelected.isNotEmpty)
            .toList()[0]
            .id
            .toString(),
        subject: titleController.text);
    loading.hide;

    if (res != null && res.toString().isNotEmpty) {
      customAlertMessage(
        txt: AppWords.send_succ.tr,
        alertType: AlertType.success.tr,
        txtBtn: AppWords.go_home.tr,
        widthBtn: 0.35.sw,
        onClick: () => goToScreen(screenNames: ScreenNames.homeScreen),
      );
      */ /*customAlertChild(
        context: Get.context!,

        child: Column(
          children: [
            const CustomImage(assetImg: AppImage.success, height: 125),
            const SizedBox(height: 8),
            CustomText(
                text: "تم ارسال طلبك بنجاح",
                fontSize: 16.sp,
                fontFamily: AppFonts.bold),
            const SizedBox(height: 32),
            CustomButton(
              text: "اذهب إلى الرئيسية",
              onPressed: () {},
            ),
          ],
        ),
      );*/ /*
    }*/
  }

  GenericCubit<File> imageCubit = GenericCubit();

  uploadImageCamera() async {
    File? f = await UploadImage().getImageByType(ImageSource.camera);

    if (f != null) {
      imageCubit.update(data: f);
    }
  }

  uploadImageFiles() async {
    File? f = await UploadImage().getImageByType(ImageSource.gallery);
    if (f != null) {
      imageCubit.update(data: f);
    }
  }
}

class SuggestItem {
  final String title;
  final String id;
  String isSelected;

  SuggestItem(
      {required this.title, required this.id, required this.isSelected});
}
