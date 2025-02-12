import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_flutter_web/features/products/presentation/all_products/widgets/product_rows.dart';
import 'package:ecommerce_flutter_web/utils/device/device_utility.dart';
import 'package:ecommerce_flutter_web/utils/paginated_data_table.dart';
import 'package:flutter/material.dart';

class ProductsTable extends StatelessWidget {
  const ProductsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPaginatedDataTable(
        minWidth: 1000,
        dataRowHeight: 64,
        columns: [
          DataColumn2(
            label: Text('Product'),
            fixedWidth: !AppDeviceUtils.isDesktopScreen(context) ? 300 : 400,
          ),
          DataColumn2(
            label: Text('Stock'),
          ),
          DataColumn2(
            label: Text('Brand'),
          ),
          DataColumn2(
            label: Text('Price'),
          ),
          DataColumn2(
            label: Text('Date'),
          ),
          DataColumn2(label: Text('Actions'), fixedWidth: 100),
        ],
        source: ProductRows());
  }
}
