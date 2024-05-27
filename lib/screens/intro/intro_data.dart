import 'package:flutter/material.dart';
import 'package:lahint/cubits/generic_cubit/generic_cubit.dart';
import 'package:lahint/models/ads_model.dart';
import 'package:lahint/utility/all_app_words.dart';

class IntroData {
  GenericCubit<int> currentPageCubit = GenericCubit<int>(data: 0);
  GenericCubit<List<AdsModel>> adsCubit =
      GenericCubit<List<AdsModel>>(data: []);
  final PageController controller = PageController();


  getAds() async {
     List<AdsModel> data = [
      AdsModel(
        title: "اطلب خدمتك عبر تطبيقنا",
        image: AppImage.sc1,
        description:
            "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
      ),
      AdsModel(
        title: "خطواتنا واضحة!",
        image: AppImage.sc2,
        description:
            "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
      ),
      AdsModel(
        title: "جودة الخدمات!",
        image: AppImage.sc3,
        description:
            "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
      ),
    ];
    adsCubit.update(data: data);

  }

  getInit( ) async {
    await getAds();
  }
}
