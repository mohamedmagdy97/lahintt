import 'package:flutter/material.dart';
import 'package:lahint/cubits/custom_items_cubits/loading_cubit/loading_cubit.dart';
import 'package:lahint/cubits/generic_cubit/generic_cubit.dart';

class AskServiceStepOneScreenData {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  GenericCubit<List<SuggestItem>> suggestItemCubit = GenericCubit(data: []);

  final formKey = GlobalKey<FormState>();

  Loading loading = Loading();

  init() {
    suggestItemCubit.update(data: [
      SuggestItem(title: "اختيار رقم 1", id: "1", isSelected: ""),
      SuggestItem(title: "اختيار رقم 2", id: "2", isSelected: "")
    ]);
  }

  selectItem(index, id) {
    suggestItemCubit.state.data!.forEach((element) => element.isSelected = "");
    suggestItemCubit.state.data![index].isSelected = id;
    suggestItemCubit.update(data: suggestItemCubit.state.data!);
    print(suggestItemCubit.state.data!
        .where((element) => element.isSelected.isNotEmpty)
        .toList()[0]
        .id);
  }

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
}

class SuggestItem {
  final String title;
  final String id;
  String isSelected;

  SuggestItem(
      {required this.title, required this.id, required this.isSelected});
}
