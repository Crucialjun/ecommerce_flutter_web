import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/widgets/app_dashboard_card.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/widgets/dashboard_order_table.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/widgets/order_status_graph.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/widgets/weekly_sales.dart';
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
            ),
            SizedBox(height: AppSizes.spaceBtwSections),

            // Order Status Graph
            WeeklySales(),
            SizedBox(height: AppSizes.spaceBtwSections),
            AppRoundedContainer(
              child: Column(
                children: [
                  Text(
                    'Recent Orders',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  DashboardOrderTable()
                ],
              ),
            ),
            SizedBox(height: AppSizes.spaceBtwSections),
            OrderStatusGraph(),
          ],
        ),
      ),
    ));
  }
}
