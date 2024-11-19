import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class RouteMiddlewares extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (route == '/login') {
      return const RouteSettings(name: '/login');
    }
    return null;
  }

}