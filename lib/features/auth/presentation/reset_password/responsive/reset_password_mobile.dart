import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/reset_password/components/reset_password_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordMobile extends StatelessWidget {
  const ResetPasswordMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = Get.arguments ?? '';
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: ResetPasswordForm(
            email: email,
          ),
        ),
      ),
    );
  }
}
