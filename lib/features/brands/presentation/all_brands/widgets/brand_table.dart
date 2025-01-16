import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_flutter_web/features/brands/presentation/all_brands/widgets/brand_rows.dart';
import 'package:ecommerce_flutter_web/utils/device/device_utility.dart';
import 'package:ecommerce_flutter_web/utils/paginated_data_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandTable extends StatelessWidget {
  const BrandTable({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPaginatedDataTable(

      minWidth: 700,
      tableHeight: 760,
      dataRowHeight: 64,
     
      columns:  [
        DataColumn2(label: Text("Brand"),fixedWidth: AppDeviceUtils.isMobileScreen(Get.context!) ? null : 200),
        DataColumn2(label: Text("Categories")),
        DataColumn2(label: Text("Featured"),fixedWidth: AppDeviceUtils.isMobileScreen(Get.context!) ? null : 100),
        DataColumn2(label: Text("Date"),fixedWidth: AppDeviceUtils.isMobileScreen(Get.context!) ? null : 200),
        DataColumn2(label: Text("Action"),fixedWidth: AppDeviceUtils.isMobileScreen(Get.context!) ? null : 100),


      
      ],
      source: BrandRows(),
    );
  }
}