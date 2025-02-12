import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductRows extends DataTableSource {
  @override
  DataRow getRow(int index) {
    return DataRow2(
      cells: [
        DataCell(Row(
          children: [
            ExtendedImage.network(
              "https://picsum.photos/200",
              width: 50,
              height: 50,
              shape: BoxShape.circle,
            ),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Flexible(
                child: Text("Product Title",
                    style: Theme.of(Get.context!)
                        .textTheme
                        .bodyLarge!
                        .apply(color: AppColors.primary))),
          ],
        )),
        DataCell(Text("256")),
        DataCell(Row(
          children: [
            ExtendedImage.network(
              "https://picsum.photos/150",
              width: 50,
              height: 50,
              shape: BoxShape.circle,
            ),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Flexible(
                child: Text("Nike",
                    style: Theme.of(Get.context!)
                        .textTheme
                        .bodyLarge!
                        .apply(color: AppColors.primary))),
          ],
        )),
        DataCell(Text("\$199.99")),
        DataCell(Text(DateTime.now().toString())),
        DataCell(Row(
          children: [
            Icon(Icons.edit),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Icon(Icons.delete),
          ],
        ))
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 100;

  @override
  int get selectedRowCount => 0;
}
