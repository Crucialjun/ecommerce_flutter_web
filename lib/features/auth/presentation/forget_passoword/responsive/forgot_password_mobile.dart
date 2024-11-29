import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/forget_passoword/components/forgot_password_form.dart';
import 'package:flutter/material.dart';

class ForgotPasswordMobile extends StatelessWidget {
  const ForgotPasswordMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: const ForgotPasswordForm(),
        ),
      ),
    );
  }
}
