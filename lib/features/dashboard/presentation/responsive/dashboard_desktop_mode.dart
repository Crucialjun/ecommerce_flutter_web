import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/widgets/app_dashboard_card.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/widgets/dashboard_order_table.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/widgets/order_status_graph.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/widgets/weekly_sales.dart';
import 'package:ecommerce_flutter_web/features/products/presentation/controller/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardDesktop extends StatelessWidget {
  const DashboardDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productsController = Get.put(ProductsController());
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
            ElevatedButton(
                onPressed: () {
                  productsController.selectThumbnailImage();
                },
                child: Text('Select Single Image')),
            const SizedBox(height: AppSizes.spaceBtwSections),
            ElevatedButton(
                onPressed: () {
                  productsController.selectMultipleProductImages();
                },
                child: Text('Select multiple Image')),
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
                Expanded(
                  child: AppDashboardCard(),
                ),
                Expanded(
                  child: AppDashboardCard(),
                )
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    spacing: AppSizes.spaceBtwSections,
                    children: [
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
                      )
                    ],
                  ),
                ),
                const SizedBox(width: AppSizes.spaceBtwSections),
                Expanded(child: OrderStatusGraph())
              ],
            )
          ],
        ),
      ),
    ));
  }
}
