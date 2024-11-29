import 'package:ecommerce_flutter_web/features/auth/presentation/login/responsive/login_screen_desktop.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/login/responsive/login_screen_mobile.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteTemplate(
      desktop: LoginScreenDesktop(),
      tablet: LoginScreenDesktop(),
      mobile: LoginScreenMobile(),
      useLayout: false,
    );
  }
}
