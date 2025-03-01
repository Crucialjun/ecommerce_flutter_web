import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_flutter_web/constants/app_assets.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CustomerRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow2(cells: [
      DataCell(Row(children: [
        ExtendedImage.asset(
          AppAssets.defaultProfile,
          width: 50,
          height: 50,
          shape: BoxShape.circle,
        ),
        SizedBox(
          width: AppSizes.spaceBtwItems,
        ),
        Expanded(
            child: Text(
          "Coding with T",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(Get.context!)
              .textTheme
              .bodyLarge!
              .apply(color: AppColors.primary),
        ))
      ])),
      DataCell(Text("support@codingwithT.com")),
      DataCell(Text("+4475452855")),
      DataCell(Text(DateTime.now().toString())),
      DataCell(Text("Active")),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 10;

  @override
  int get selectedRowCount => 0;
}
