import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderStatusGraph extends StatelessWidget {
  const OrderStatusGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return AppRoundedContainer(
      child: Column(
        children: [
          Text(
            "Order Status",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: AppSizes.spaceBtwSections,
          ),
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 40,
            ),
          ),
        ],
      ),
    );
  }
}
