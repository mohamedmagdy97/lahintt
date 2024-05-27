import 'package:flutter/material.dart';
import 'package:lahint/components/button/button.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/screens/service_screens/service_details/components/description_view.dart';
import 'package:lahint/screens/service_screens/service_details/components/implement_view.dart';
import 'package:lahint/screens/service_screens/service_details/components/requirements_view.dart';
import 'package:lahint/screens/service_screens/service_details/components/service_details_header.dart';
import 'package:lahint/screens/service_screens/service_details/components/service_tab_bar.dart';

class ServiceDetailsScreen extends StatefulWidget {
  static String route = "ServiceDetailsScreen";

  const ServiceDetailsScreen({super.key});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen>
    with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          text: "ابدأ الخدمة",
          onPressed: () {
            goToScreen(screenNames: ScreenNames.askServiceStepOneScreen);
          },
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
                  children: const [
                    DescriptionView(),
                    RequirementsView(),
                    ImplementView(),
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
