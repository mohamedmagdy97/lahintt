import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lahint/components/custom_app_bar/custom_app_bar.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/components/trans_form_flip_widget.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/cubits/custom_items_cubits/loading_cubit/loading_cubit.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/screens/home/components/navigation_bar/custom_navigation_bar.dart';
import 'package:lahint/components/screen.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';

class AllServicesScreen extends StatefulWidget {
  static String route = "AllServicesScreen";

  const AllServicesScreen({super.key});

  @override
  State<AllServicesScreen> createState() => _AllServicesScreenState();
}

class _AllServicesScreenState extends State<AllServicesScreen> {
  @override
  void initState() {
    // homeData.getSliderOffers();
    /* if (Get.currentRoute == ScreenNames.homeScreen&&
        !(BlocProvider.of<GenericCubit<List<SliderItem>?>>(Get.context!).state
            is  GenericUpdate)) {
      homeData.getSliderOffers();
    }*/

    super.initState();
  }

  Loading loading = Loading();

  @override
  Widget build(BuildContext context) {
    return Screen(
      loading: loading,
      child: Scaffold(
        // drawer: DrawerScreen(homeData: homeData),
        appBar: CustomAppBar(textAppBar: "الخدمات الاونلاين", showBack: true),
        bottomNavigationBar: const MenuApp(MenuState.home),
        body: /*RefreshIndicator(
            color: AppColors.secondaryColor,
            backgroundColor: AppColors.white,
            onRefresh: () async {
              if (!BlocProvider.of<UserCubit>(Get.context!, listen: false)
                  .iSUserVisitor) {
                BlocProvider.of<UserCubit>(Get.context!, listen: false)
                    .getWallet();
              }
            },
            child:*/
            ListView(
          padding: EdgeInsets.all(16),
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  7,
                  (index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.lightGrey),
                          color: index == 0
                              ? AppColors.mainColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(30)),
                      child: CustomText(
                        text: index == 0 ? HourlyTR.all.tr : "تأمينات",
                        fontSize: 16,
                        color: index == 0 ? AppColors.white : AppColors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ...List.generate(
              4,
              (index) => InkWell(
                onTap: () =>
                    goToScreen(screenNames: ScreenNames.serviceDetailsScreen),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                // borderRadius: BorderRadius.circular(12),
                                color: AppColors.bgAppBar),
                            child: CustomImage(
                              assetImg: 'sliderItem.image!'.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                  text: 'استخراج رخصة قيادة',
                                  fontSize: 16,
                                  fontFamily: AppFonts.medium),
                              const SizedBox(height: 8),
                              const CustomText(
                                  text: 'يمكنك استخراج رخصة قيادة من هنا',
                                  color: AppColors.grey,
                                  fontSize: 12),
                            ],
                          ),
                          const Spacer(),
                          const TransFormFlipWidget(
                              child: CustomImage(assetImg: AppImage.back)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        // ),
      ),
    );
  }
}
