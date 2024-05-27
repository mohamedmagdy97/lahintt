// import 'dart:io' as io;

// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPush(Route route, Route? previousRoute) async {
    if (route.settings.name
        .toString()
        .toLowerCase()
        .replaceAll("/", "")
        .isNotEmpty) {}
    super.didPush(route, previousRoute);
  }
}
