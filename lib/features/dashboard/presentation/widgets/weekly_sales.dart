import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:ecommerce_flutter_web/utils/device/device_utility.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeeklySales extends StatelessWidget {
  const WeeklySales({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return AppRoundedContainer(
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
                              borderRadius: BorderRadius.circular(AppSizes.sm),
                              color: AppColors.primary,
                            )
                          ],
                        ))
                    .toList(),
                groupsSpace: AppSizes.spaceBtwItems,
                barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (_) => AppColors.secondary,
                    ),
                    touchCallback: AppDeviceUtils.isDesktopScreen(context)
                        ? (barTouchEvent, response) {
                            print("This is $response");
                          }
                        : null),
              ),
            ),
          )
        ],
      ),
    );
  }
  
   FlTitlesData buildTitlesData() {
    return FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

            final index = value.toInt() % 7;

            final day = days[index];

            return SideTitleWidget(
              axisSide: AxisSide.bottom,
              space: 0,
              child: Text(day),
            );
          },
        )),
        leftTitles: AxisTitles(
          sideTitles:
              SideTitles(showTitles: true, interval: 200, reservedSize: 50),
        ),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)));
  }
}
