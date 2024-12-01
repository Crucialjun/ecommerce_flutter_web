import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/features/auth/controller/auth_controller.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/login/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class RouteMiddlewares extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authController = locator<AuthController>();

    bool isUserLoggedIn = authController.isUserLoggedIn;

    if (!isUserLoggedIn) {
      return const RouteSettings(name: LoginScreen.routeName);
    } else {
      return null;
    }
  }
}
