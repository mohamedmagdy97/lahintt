import 'package:flutter/material.dart';
 import 'package:get/get.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/button/button.dart';
import 'package:lahint/components/custom_app_bar/custom_app_bar.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/components/no_found_data/custom_no_found_data.dart';
import 'package:lahint/components/screen.dart';
import 'package:lahint/components/text_filed/text_filed_custom.dart';
 import 'package:lahint/helper/validation_form.dart';
 import 'package:lahint/routes/routes.dart';
import 'package:lahint/screens/search/search_data.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';

class Search extends StatefulWidget {
  static String route = "/SearchScreen";

  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  SearchData searchData = SearchData();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      loading: searchData.loading,
      child: Scaffold(
        appBar: CustomAppBar(showBack: true, textAppBar: IndivL.search.tr),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomTextField(
                controller: searchData.searchController,
                hintText: AppWords.search_about.tr,
                inputType: TextInputType.text,
                labelText: '',
                onChanged: (v) => Future.delayed(
                  const Duration(milliseconds: 1500),
                  () => searchData.getResult(),
                ),
                onFieldSubmitted: (v) => searchData.getResult(),
                contentPadding: 12,
                fillColor: AppColors.lightGrey,
                prefixIcon: AppImage.search,
                borderRadius: 8,
                fillBorderColor: Colors.transparent,
                textFieldVaidType: TextFieldValidatorType.Optional,
              ),
              const Divider(),
              Expanded(
                child: Container(
                  child: 1 == 0
                      ? SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(height: 1),
                        NoFoundData(
                          img: AppImage.no_data,
                          errorMessage: AppWords.not_found.tr,
                          errorMessage2: AppWords.not_found_txt.tr,
                        ),
                        CustomButton(
                            text: IndivL.backtohome.tr,
                            onPressed: () => goBack())
                      ],
                    ),
                  )
                      : ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      ...List.generate(
                        3,
                            (index) => Container(
                          // padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(bottom: 16),
                          child: InkWell(
                              onTap: () {},
                              child: Card(
                                child: Padding(
                                  padding:
                                  const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration:
                                        const BoxDecoration(
                                            shape:
                                            BoxShape.circle,
                                            // borderRadius: BorderRadius.circular(12),
                                            color: AppColors
                                                .bgAppBar),
                                        child: const CustomImage(
                                          assetImg: "http",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        mainAxisSize:
                                        MainAxisSize.min,
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                        children: [
                                          CustomText(
                                              text: "name title"
                                                  .toString(),
                                              fontSize: 16,
                                              fontFamily:
                                              AppFonts.medium),
                                          const SizedBox(height: 8),
                                          CustomText(
                                              text: "description"
                                                  .toString(),
                                              color: AppColors.grey,
                                              fontSize: 12),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ),
                      ...List.generate(
                        2,
                            (index) => Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: InkWell(
                            onTap: () {},
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
                                      child: const CustomImage(
                                        assetImg: "http",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize:
                                        MainAxisSize.min,
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                        children: [
                                          CustomText(
                                              text:
                                              'name'.toString(),
                                              fontSize: 16,
                                              fontFamily:
                                              AppFonts.medium),
                                          const SizedBox(height: 8),
                                          CustomText(
                                              text: 'description'
                                                  .toString(),
                                              color: AppColors.grey,
                                              fontSize: 12),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
