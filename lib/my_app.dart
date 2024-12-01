import 'package:ecommerce_flutter_web/constants/text_strings.dart';
import 'package:ecommerce_flutter_web/core/routes.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/login/login_screen.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/dashboard_screen.dart';
import 'package:ecommerce_flutter_web/theme/theme.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TextStrings.appName,
      theme: AppTheme.lightTheme,
      //darkTheme: AppTheme.darkTheme,
      getPages: Routes.routes,
      debugShowCheckedModeBanner: false,
      initialRoute: DashboardScreen.routeName,
      unknownRoute: GetPage(
        name: '/not-found',
        page: () => const Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        ),
      ),
    );
  }
}
