import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/widgets/app_dashboard_card.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/widgets/order_status_graph.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/widgets/weekly_sales.dart';
import 'package:flutter/material.dart';

class DashboardMobile extends StatelessWidget {
  const DashboardMobile({
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
            AppDashboardCard(),
            SizedBox(height: AppSizes.spaceBtwItems),
            AppDashboardCard(),
            SizedBox(height: AppSizes.spaceBtwItems),
            AppDashboardCard(),
            SizedBox(height: AppSizes.spaceBtwItems),
            AppDashboardCard(),

            SizedBox(height: AppSizes.spaceBtwSections),

            // Order Status Graph
            WeeklySales(),
            SizedBox(height: AppSizes.spaceBtwSections),
            AppRoundedContainer(),
            SizedBox(height: AppSizes.spaceBtwSections),
            OrderStatusGraph(),
          ],
        ),
      ),
    ));
  }
}