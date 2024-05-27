import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lahint/components/alert/custom_alert_option.dart';
import 'package:lahint/cubits/custom_items_cubits/loading_cubit/loading_cubit.dart';
import 'package:lahint/cubits/generic_cubit/generic_cubit.dart';
import 'package:lahint/models/categery_model.dart';
import 'package:lahint/models/slider_item_model.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/utility/all_app_words.dart';

HomeData homeData = HomeData();

class HomeData {
  Loading loading = Loading();
  final PageController controller = PageController();
  GenericCubit<int> currentPageCubit = GenericCubit<int>(data: 0);

  GenericCubit<List<SliderItemModel>> sliderCubit = GenericCubit(data: []);

  GenericCubit<List<CategoryModel>> catsListCubit = GenericCubit(data: []);
  GenericCubit<double> rateStoreCubit = GenericCubit(data: 0.0);
  GenericCubit<double> rateDeliveryCubit = GenericCubit(data: 0.0);

  initData() async {
    await getCategories();
    getSlider();
  }

  getCategories() async {
    loading.show;

    List<CategoryModel>? res = [
      CategoryModel(
          name: "service 1", image: "http", describtion: "describtion 1"),
      CategoryModel(
          name: "service 2", image: "http", describtion: "describtion 2"),
      CategoryModel(
          name: "service 3", image: "http", describtion: "describtion 3"),
      CategoryModel(
          name: "service 4", image: "http", describtion: "describtion 4"),
    ];

    catsListCubit.update(data: res);
    loading.hide;
  }

  getSlider() async {
    List<SliderItemModel>? value = [
      SliderItemModel(image: "http"),
      SliderItemModel(image: "http"),
      SliderItemModel(image: "http"),
      SliderItemModel(image: "http"),
      SliderItemModel(image: "http"),
      SliderItemModel(image: "http"),
    ];

    sliderCubit.update(data: value);
  }

  rateStore() async {}

  rateDelivery() async {}

  onSelectCategory(CategoryModel model) async {
    goToScreen(screenNames: ScreenNames.serviceDetailsScreen);
  }

  logOutUser() async {
    await customAlertOptional(
      title: AppWords.alert_logout.tr,
      textButton: AppWords.yes.tr,
      alertType: AppWords.logoutD.tr,
      onTap: () async {
        goBack();
        goToWithRemoveRoute(screenNames: ScreenNames.loginScreen);
      },
      onCancel: () => goBack(),
    );
  }

  DateTime? currentBackPressTime;
}
