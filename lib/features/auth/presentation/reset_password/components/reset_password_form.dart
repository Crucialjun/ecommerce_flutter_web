import 'package:ecommerce_flutter_web/constants/app_assets.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/login/login_screen.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
            onTap: () => Get.offAllNamed(LoginScreen.routeName),
            child: const Icon(
              Icons.clear,
            )),
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        ExtendedImage.asset(
          AppAssets.emailReceived,
          width: 300,
          height: 300,
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        Text(
          'Password Reset Email Sent',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        Text(email,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        Text(
          'Your account security is our Priority! We have sent a secure link to safely change your password and keep your account protected.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(
          height: AppSizes.spaceBtwSections,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.offAllNamed(LoginScreen.routeName),
            child: const Text('Done'),
          ),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () => Get.offAllNamed(LoginScreen.routeName),
            child: const Text('Resend Email'),
          ),
        ),
      ],
    );
  }
}
