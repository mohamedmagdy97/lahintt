import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/button/button.dart';
import 'package:lahint/cubits/generic_cubit/generic_cubit.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:flutter/material.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/utility/app_theme.dart';
import '../../components/custom_image/custom_image.dart';

class SuccessScreen extends StatefulWidget {
  static String routeName = '/SuccessScreen';

  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  GenericCubit<bool> isFromOrder = GenericCubit(data: false);

  check() async {
    isFromOrder.update(data: await Get.arguments);
  }

  @override
  void initState() {
    check();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
        bloc: isFromOrder,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImage(
                  assetImg: AppImage.success,
                  height: 0.25.sh,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: CustomText(
                    text: HourlyTR.paymentsuccess.tr,
                    fontSize: 16.sp,
                    color: AppColors.mainColor,
                    fontFamily: AppFonts.bold,
                  ),
                ),
                Visibility(
                  visible: state.data!,
                  replacement: CustomButton(
                    text: IndivL.backtohome.tr,
                    onPressed: () => goToWithRemoveRoute(
                        screenNames: ScreenNames.homeScreen),
                  ),
                  child: CustomButton(
                    text: AppWords.follow_order.tr,
                    onPressed: () => goToWithRemoveRoute(
                        screenNames: ScreenNames.myServices, arguments: true),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
