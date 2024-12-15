import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/widgets/app_dashboard_card.dart';
import 'package:flutter/material.dart';

class DashboardTablet extends StatelessWidget {
  const DashboardTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),
            Row(
              spacing: AppSizes.spaceBtwItems,
              children: [
                Expanded(
                  child: AppDashboardCard(),
                ),
                Expanded(
                  child: AppDashboardCard(),
                ),
              ],
            ),
            SizedBox(height: AppSizes.spaceBtwItems),
            Row(
              spacing: AppSizes.spaceBtwItems,
              children: [
                Expanded(
                  child: AppDashboardCard(),
                ),
                Expanded(
                  child: AppDashboardCard(),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
