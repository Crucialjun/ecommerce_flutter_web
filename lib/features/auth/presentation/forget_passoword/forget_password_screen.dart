import 'package:ecommerce_flutter_web/features/auth/presentation/forget_passoword/responsive/forgot_password_desktop.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/forget_passoword/responsive/forgot_password_mobile.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = '/forget-password';
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteTemplate(
      desktop: ForgotPasswordDesktop(),
      tablet: ForgotPasswordDesktop(),
      mobile: ForgotPasswordMobile(),
      useLayout: false,
    );
  }
}
