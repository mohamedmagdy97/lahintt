import 'package:lahint/screens/all_services/all_services.dart';
import 'package:lahint/screens/attatchments/attatchments.dart';
import 'package:lahint/screens/auth/login/login_screen.dart';
import 'package:lahint/screens/auth/sign_up/sign_up_screen.dart';
import 'package:lahint/screens/auth/verify_code/verify_code_screen.dart';
import 'package:lahint/screens/chat_bot/chat_bot.dart';
import 'package:lahint/screens/help/help.dart';
import 'package:lahint/screens/home/tabs/my_account/my_account.dart';
import 'package:lahint/screens/home/tabs/support/support.dart';
import 'package:lahint/screens/home/tabs/my_services/my_services.dart';
import 'package:lahint/screens/language/language_screen.dart';
import 'package:lahint/screens/my_account_profile/my_account_profile.dart';
 import 'package:lahint/screens/intro/intro.dart';
import 'package:lahint/screens/privacy/privacy_screen.dart';
 import 'package:lahint/screens/search/search.dart';
import 'package:lahint/screens/service_screens/ask_service_step_one/ask_service_step_one.dart';
import 'package:lahint/screens/service_screens/ask_service_step_three/ask_service_step_three.dart';
import 'package:lahint/screens/service_screens/ask_service_step_two/ask_service_step_two.dart';
import 'package:lahint/screens/service_screens/service_details/service_details.dart';
import 'package:lahint/screens/service_screens/service_inprogress_details/service_inprogress_details.dart';
import 'package:lahint/screens/service_screens/service_review/service_review.dart';
import 'package:lahint/screens/service_screens/service_success/service_success.dart';
import 'package:lahint/screens/setting/setting.dart';
import 'package:lahint/screens/splash/splash_screen.dart';
import 'package:lahint/screens/home/tabs/home/home_screen.dart';
import 'package:lahint/screens/notifications/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lahint/screens/succcess/fail_screen.dart';
import 'package:lahint/screens/succcess/success_screen.dart';

part 'app_navigator.dart';

appRoutes(context) {
  var routes = {
    ScreenNames.homeScreen: (context) => const HomeScreen(),
    ScreenNames.successScreen: (context) => const SuccessScreen(),
    ScreenNames.failScreen: (context) => const FailScreen(),
    // ScreenNames.storyViewScreen: (context) => const StoryViewScreen(),
    ScreenNames.introScreen: (context) => const IntroScreen(),
     ScreenNames.favoriteScreen: (context) => const SupportScreen(),
    ScreenNames.myAccount: (context) => const MyAccount(),
    ScreenNames.loginScreen: (context) => const LoginScreen(),
     ScreenNames.signUp: (context) => const SignUp(),
    ScreenNames.splashScreen: (context) => const SplashScreen(),
    ScreenNames.searchScreen: (context) => const Search(),
    ScreenNames.userNotificationScreen: (context) =>
        const UserNotificationScreen(),
    ScreenNames.verifyCodeScreen: (context) => const VerifyCode(),
    ScreenNames.myServices: (context) => const MyServices(),
    ScreenNames.allServicesScreen: (context) => const AllServicesScreen(),
    ScreenNames.serviceDetailsScreen: (context) => const ServiceDetailsScreen(),
    ScreenNames.myAccountProfile: (context) => const MyAccountProfile(),
    ScreenNames.setting: (context) => const Setting(),
    ScreenNames.languageScreen: (context) => const LanguageScreen(),
    ScreenNames.privacyScreen: (context) => const PrivacyScreen(),
    ScreenNames.helpScreen: (context) => const HelpScreen(),
    ScreenNames.chatBotScreen: (context) => const ChatBotScreen(),
    ScreenNames.serviceInProgressDetailsScreen: (context) =>
        const ServiceInProgressDetailsScreen(),
    ScreenNames.attachmentsScreen: (context) => const AttachmentsScreen(),
    ScreenNames.askServiceStepOneScreen: (context) =>
        const AskServiceStepOneScreen(),
    ScreenNames.askServiceStepTwoScreen: (context) =>
        const AskServiceStepTwoScreen(),
    ScreenNames.askServiceStepThreeScreen: (context) =>
        const AskServiceStepThreeScreen(),
    ScreenNames.serviceReviewScreen: (context) => const ServiceReviewScreen(),
    ScreenNames.serviceSuccessScreen: (context) => const ServiceSuccessScreen(),
  };

  return routes;
}

class ScreenNames {
  static const String defaultscreen = "/";
  static String homeScreen = HomeScreen.route;
  static String successScreen = SuccessScreen.routeName;
  static String failScreen = FailScreen.routeName;
  static String myAccountProfile = MyAccountProfile.routeName;
  static String setting = Setting.routeName;
  static String languageScreen = LanguageScreen.routeName;
  static String privacyScreen = PrivacyScreen.routeName;
  static String helpScreen = HelpScreen.routeName;

  // static String storyViewScreen = StoryViewScreen.route;
  static String introScreen = IntroScreen.route;

  static String allServicesScreen = AllServicesScreen.route;
  static String serviceDetailsScreen = ServiceDetailsScreen.route;
  static String serviceInProgressDetailsScreen =
      ServiceInProgressDetailsScreen.route;

   static String loginScreen = '/LoginScreen';

  static String myServices = MyServices.routeName;

  static String attachmentsScreen = AttachmentsScreen.routeName;
  static String favoriteScreen = SupportScreen.routeName;
  static String chatBotScreen = ChatBotScreen.routeName;
  static String askServiceStepOneScreen = AskServiceStepOneScreen.routeName;
  static String askServiceStepTwoScreen = AskServiceStepTwoScreen.routeName;
  static String askServiceStepThreeScreen = AskServiceStepThreeScreen.routeName;
  static String serviceReviewScreen = ServiceReviewScreen.routeName;
  static String serviceSuccessScreen = ServiceSuccessScreen.routeName;
  static String myAccount = MyAccount.routeName;
  static String signUp = SignUp.routeName;
  static String splashScreen = SplashScreen.routeName;
  static String searchScreen = Search.route;

  static String userNotificationScreen = UserNotificationScreen.routeName;
  static String verifyCodeScreen = VerifyCode.routeName;
}
