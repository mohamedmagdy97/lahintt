import 'dart:io';

import 'package:image_picker/image_picker.dart';

class UploadImage {
  final ImagePicker picker = ImagePicker();

  Future<File?> getImageByType(ImageSource imageSource) async {
    try {
      final pickedFile =
          await picker.pickImage(source: imageSource, imageQuality: 50);
      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
