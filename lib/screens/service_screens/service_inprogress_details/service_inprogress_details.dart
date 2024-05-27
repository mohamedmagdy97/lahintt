import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/button/button.dart';
import 'package:lahint/screens/service_screens/service_inprogress_details/components/rating_bottom_sheet.dart';
import 'package:lahint/screens/service_screens/service_inprogress_details/components/status_view.dart';
import 'package:lahint/screens/service_screens/service_inprogress_details/components/attachements_view.dart';
import 'package:lahint/screens/service_screens/service_inprogress_details/components/service_details_header.dart';
import 'package:lahint/screens/service_screens/service_inprogress_details/components/service_tab_bar.dart';
import 'package:lahint/screens/service_screens/service_inprogress_details/service_inprogress_details_data.dart';
import 'package:lahint/utility/app_theme.dart';

class ServiceInProgressDetailsScreen extends StatefulWidget {
  static String route = "ServiceInProgressDetailsScreen";

  const ServiceInProgressDetailsScreen({super.key});

  @override
  State<ServiceInProgressDetailsScreen> createState() =>
      _ServiceInProgressDetailsScreenState();
}

class _ServiceInProgressDetailsScreenState
    extends State<ServiceInProgressDetailsScreen>
    with TickerProviderStateMixin {
  TabController? tabController;

  ServiceInProgressDetailsData serviceInProgressDetailsData =
      ServiceInProgressDetailsData();

  @override
  void initState() {
    tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    serviceInProgressDetailsData.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              text: "إعادة جدولة الميعاد",
              onPressed: () {},
            ),
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: Get.context!,
                  constraints: BoxConstraints(maxHeight: 0.5.sh),
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  isScrollControlled: true,
                  useSafeArea: true,
                  builder: (context) => const RatingBottomSheet(),
                );
              },
              child: CustomText(
                text: "تقييم الخدمة / الغاء الخدمة",
                fontSize: 14,
                color: AppColors.mainColor,
                fontFamily: AppFonts.heavy,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const ServiceDetailsHeader(),
            const SizedBox(height: 16),
            ServiceTabBar(tabController: tabController),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TabBarView(
                  controller: tabController,
                  children: [
                    const StatusView(),
                    AttachmentsView(
                        serviceInProgressDetailsData:
                            serviceInProgressDetailsData),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
