import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/forget_passoword/components/forgot_password_form.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/reset_password/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ForgotPasswordDesktop extends StatelessWidget {
  const ForgotPasswordDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 550,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
              top: AppSizes.appBarHeight,
              left: AppSizes.defaultSpace,
              right: AppSizes.defaultSpace,
              bottom: AppSizes.defaultSpace),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
            color: AppColors.white,
          ),
          child: const ForgotPasswordForm(),
        ),
      ),
    ));
  }
}
