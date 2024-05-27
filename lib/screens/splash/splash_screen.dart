import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:flutter/material.dart';
import 'package:lahint/routes/routes.dart';
import '../../components/custom_image/custom_image.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/SplashScreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 3000),
      () async {
        goToScreenPushNamedAndpop(screenNames: ScreenNames.introScreen);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: CustomImage(
            assetImg: AppImage.logo,
            height: 0.5.sh,
          ),
        ),
      ),
    );
  }
}

