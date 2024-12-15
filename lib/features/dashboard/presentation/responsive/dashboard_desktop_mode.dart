import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/widgets/app_dashboard_card.dart';
import 'package:ecommerce_flutter_web/utils/device/device_utility.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardDesktop extends StatelessWidget {
  const DashboardDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
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
                Expanded(
                  child: AppDashboardCard(),
                ),
                Expanded(
                  child: AppDashboardCard(),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    spacing: AppSizes.spaceBtwSections,
                    children: [
                      AppRoundedContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Weekly Sales",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(
                              height: AppSizes.spaceBtwItems,
                            ),
                            SizedBox(
                              height: 400,
                              child: BarChart(
                                BarChartData(
                                  titlesData: buildTitlesData(),
                                  borderData: FlBorderData(
                                    show: true,
                                    border: Border(
                                      top: BorderSide.none,
                                      right: BorderSide.none,
                                    ),
                                  ),
                                  gridData: FlGridData(
                                    show: true,
                                    drawHorizontalLine: true,
                                    drawVerticalLine: false,
                                    horizontalInterval: 200,
                                    getDrawingHorizontalLine: (value) {
                                      return FlLine(
                                        color: Colors.black,
                                        strokeWidth: 0.5,
                                      );
                                    },
                                  ),
                                  barGroups: controller.weeklySales
                                      .asMap()
                                      .entries
                                      .map((e) => BarChartGroupData(
                                            x: e.key,
                                            barRods: [
                                              BarChartRodData(
                                                toY: e.value,
                                                width: 30,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppSizes.sm),
                                                color: AppColors.primary,
                                              )
                                            ],
                                          ))
                                      .toList(),
                                  groupsSpace: AppSizes.spaceBtwItems,
                                  barTouchData: BarTouchData(
                                      touchTooltipData: BarTouchTooltipData(
                                        getTooltipColor: (_) =>
                                            AppColors.secondary,
                                      ),
                                      touchCallback:
                                          AppDeviceUtils.isDesktopScreen(
                                                  context)
                                              ? (barTouchEvent, response) {
                                                  print("This is $response");
                                                }
                                              : null),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      AppRoundedContainer()
                    ],
                  ),
                ),
                Expanded(child: AppRoundedContainer())
              ],
            )
          ],
        ),
      ),
    ));
  }

  buildTitlesData() {}
}
