import 'package:data_table_2/data_table_2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/dashboard/data/models/order_model.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/controller/dashboard_controller.dart';

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
          SizedBox(
            height: 400,
            child: PieChart(
              PieChartData(
                sections: controller.orderStatusData.entries.map((entry) {
                  final status = entry.key;
                  final count = entry.value;
                  return PieChartSectionData(
                    showTitle: true,
                    title: count.toString(),
                    value: count.toDouble(),
                    titleStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    radius: 100,
                    color: status == OrderStatusEnum.delivered
                        ? Colors.green
                        : status == OrderStatusEnum.shipped
                            ? Colors.blue
                            : status == OrderStatusEnum.processing
                                ? Colors.orange
                                : status == OrderStatusEnum.pending
                                    ? Colors.red
                                    : Colors.grey,
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
                columns: [
                  DataColumn2(
                    label: Text('Status'),
                  ),
                  DataColumn2(
                    label: Text('Orders'),
                  ),
                  DataColumn2(
                    label: Text('Total'),
                  ),
                ],
                rows: controller.orderStatusData.entries
                    .map((entry) => DataRow(cells: [
                          DataCell(Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: entry.key == OrderStatusEnum.delivered
                                      ? Colors.green
                                      : entry.key == OrderStatusEnum.shipped
                                          ? Colors.blue
                                          : entry.key ==
                                                  OrderStatusEnum.processing
                                              ? Colors.orange
                                              : entry.key ==
                                                      OrderStatusEnum.pending
                                                  ? Colors.red
                                                  : Colors.grey,
                                ),
                              ),
                              Expanded(child: Text(" ${entry.key.value}")),
                            ],
                          )),
                          DataCell(Text(entry.value.toString())),
                          DataCell(Text(
                              controller.totalAmounts[entry.key].toString())),
                        ]))
                    .toList()),
          )
        ],
      ),
    );
  }
}
