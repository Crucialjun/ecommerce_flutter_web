import 'package:ecommerce_flutter_web/constants/app_assets.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/login/login_screen.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/reset_password/components/reset_password_form.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordDesktop extends StatelessWidget {
  const ResetPasswordDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = Get.arguments ?? '';
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
          child: ResetPasswordForm(email: email),
        ),
      ),
    ));
  }
}
