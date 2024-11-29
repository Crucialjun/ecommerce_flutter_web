import 'package:ecommerce_flutter_web/features/auth/presentation/reset_password/responsive/reset_password_desktop.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/reset_password/responsive/reset_password_mobile.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String routeName = '/reset-password/';
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteTemplate(
      useLayout: false,
      desktop: ResetPasswordDesktop(),
      tablet: ResetPasswordDesktop(),
      mobile: ResetPasswordMobile(),
    );
  }
}
