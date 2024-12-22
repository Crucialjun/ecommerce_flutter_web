import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class BreadcrumbsWithHeading extends StatelessWidget {
  const BreadcrumbsWithHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dashboard',
          style:
              Theme.of(context).textTheme.bodySmall!.apply(fontWeightDelta: -1),
        ),
        const SizedBox(height: AppSizes.spaceBtwSections),
      ],
    );
  }
}
