import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lahint/cubits/custom_items_cubits/loading_cubit/loading_cubit.dart';
import 'package:lahint/cubits/generic_cubit/generic_cubit.dart';
import 'package:lahint/helper/upload_image.dart';

class AskServiceStepTwoScreenData {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Loading loading = Loading();

  init() {}

  sendComplaint() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
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
