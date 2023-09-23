import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../userStore/user_store.dart';
import 'route_name.dart';

class RouteAuthMiddleWare extends GetMiddleware {
  @override
  // ignore: overridden_fields
  int? priority = 0;
  RouteAuthMiddleWare({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.islogin ||
        route == AppRouteName.initialPage ||
        route == AppRouteName.signInPage) {
      return null;
    } else {
      Future.delayed(
        const Duration(seconds: 1),
        () => Get.snackbar(
          "Tips:",
          "Please login to continue",
          backgroundColor: Colors.red,
        ),
      );
      return const RouteSettings(name: AppRouteName.signInPage);
    }
  }
}
