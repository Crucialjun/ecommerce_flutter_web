import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/utils/device/device_utility.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow2(
      cells: [
        DataCell(Row(
          children: [
            Container(
              decoration: BoxDecoration(color: AppColors.primaryBackground),
              width: 50,
              height: 50,
              padding: EdgeInsets.all(AppSizes.sm),
              child: ExtendedImage.network(
                "https://via.placeholder.com/150",
                shape: BoxShape.circle,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: AppSizes.spaceBtwItems),
            Expanded(
              child: Text("Adidas",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(Get.context!).textTheme.bodyLarge),
            ),
          ],
        )),
        DataCell(Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.sm),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Wrap(
              spacing: AppSizes.xs,
              direction: AppDeviceUtils.isMobileScreen(Get.context!)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        bottom: AppDeviceUtils.isMobileScreen(Get.context!)
                            ? 0
                            : AppSizes.xs),
                    child: Chip(
                      label: Text("Shoes"),
                      padding: EdgeInsets.all(AppSizes.xs),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: AppDeviceUtils.isMobileScreen(Get.context!)
                            ? 0
                            : AppSizes.xs),
                    child: Chip(
                      label: Text("TrackSuits"),
                      padding: EdgeInsets.all(AppSizes.xs),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: AppDeviceUtils.isMobileScreen(Get.context!)
                            ? 0
                            : AppSizes.xs),
                    child: Chip(
                      label: Text("Joggers"),
                      padding: EdgeInsets.all(AppSizes.xs),
                    )),
              ],
            ),
          ),
        )),
        DataCell(Icon(
          Icons.favorite,
          color: AppColors.primary,
        )),
        DataCell(Text(DateTime.now().toString())),
        DataCell(Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Get.toNamed(EditCategoryScreen.route);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          ],
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 20;

  @override
  int get selectedRowCount => 0;
}
