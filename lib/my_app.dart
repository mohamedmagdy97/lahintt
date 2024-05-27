import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahint/helper/route_observer.dart';
import 'package:lahint/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/lang.dart';
import 'utility/app_theme.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatefulWidget {
  final Locale? currentLocale;

  const MyApp({super.key, this.currentLocale});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: ScreenUtilInit(
        designSize: const Size(414, 896),
        builder: (context, child) => SafeArea(
          bottom: true,
          top: false,
          child: GetMaterialApp(
            enableLog: true,
            locale: widget.currentLocale,
            fallbackLocale: widget.currentLocale,
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
            ],
            initialRoute: ScreenNames.splashScreen,
            routes: appRoutes(context),
            navigatorObservers: [MyRouteObserver(), routeObserver],
            translations: Lang(),
            supportedLocales: const [
              Locale('ar', 'SA'),
              Locale('en', 'US'),
            ],
          ),
        ),
      ),
    );
  }
}
