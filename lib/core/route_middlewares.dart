import 'dart:async';

import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/features/auth/controller/auth_controller.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:logger/logger.dart';

class RouteMiddlewares extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (FirebaseAuth.instance.currentUser == null) {
      Logger().i("User not authenticated");
      return const RouteSettings(name: "/login");
    } else {
      return null;
    }
  }
}
