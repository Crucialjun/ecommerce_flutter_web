import 'package:ecommerce_flutter_web/constants/app_assets.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExtendedImage.asset(
              AppAssets.logoBlack,
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),
            Text(
              'Welcome Back',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: AppSizes.sm,
            ),
            Text(
              'Discover Limitless Choices and Unmatched Convenience',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ));
  }
}
