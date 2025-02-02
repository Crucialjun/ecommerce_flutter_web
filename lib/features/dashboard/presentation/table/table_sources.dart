import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderRows extends DataTableSource {
  final controller = Get.put(DashboardController());
  @override
  DataRow? getRow(int index) {
    return DashboardController.orders.length > index
        ? DataRow(cells: [
            DataCell(Text(
              DashboardController.orders[index].id,
              style: Theme.of(Get.context!)
                  .textTheme
                  .bodyLarge!
                  .apply(color: AppColors.primary),
            )),
            DataCell(
                Text(DashboardController.orders[index].orderDate.toString())),
            DataCell(Text("7 Items")),
            DataCell(AppRoundedContainer(
              radius: AppSizes.cardRadiusSm,
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.md, vertical: AppSizes.xs),
              backgroundColor: DashboardController.orders[index].status.value ==
                      "Delivered"
                  ? Colors.green.withValues(alpha: 0.1)
                  : DashboardController.orders[index].status.value == "Shipped"
                      ? Colors.blue.withValues(alpha: 0.1)
                      : DashboardController.orders[index].status.value ==
                              "Processing"
                          ? Colors.orange.withValues(alpha: 0.1)
                          : DashboardController.orders[index].status.value ==
                                  "Pending"
                              ? Colors.red.withValues(alpha: 0.1)
                              : AppColors.grey.withValues(alpha: 0.1),
              child: Text(DashboardController.orders[index].status.value,
                  style: TextStyle(
                      color: DashboardController.orders[index].status.value ==
                              "Delivered"
                          ? Colors.green
                          : DashboardController.orders[index].status.value ==
                                  "Shipped"
                              ? Colors.blue
                              : DashboardController
                                          .orders[index].status.value ==
                                      "Processing"
                                  ? Colors.orange
                                  : DashboardController
                                              .orders[index].status.value ==
                                          "Pending"
                                      ? Colors.red
                                      : AppColors.grey)),
            )),
            DataCell(
                Text("\$${DashboardController.orders[index].totalAmount}")),
          ])
        : null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => DashboardController.orders.length;

  @override
  int get selectedRowCount => 0;
}
