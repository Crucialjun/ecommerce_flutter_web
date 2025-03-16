import 'package:data_table_2/data_table_2.dart';

import 'package:ecommerce_flutter_web/features/dashboard/presentation/table/table_sources.dart';
import 'package:ecommerce_flutter_web/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OrdersTable extends StatelessWidget {
  const OrdersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable2(
      minWidth: 700,
      columns: [
        DataColumn2(label: Text('Order ID')),
        DataColumn2(label: Text('Date')),
        DataColumn2(label: Text('Items')),
        DataColumn2(
            label: Text(
              'Status',
            ),
            fixedWidth: AppDeviceUtils.isMobileScreen(context) ? 120 : null),
        DataColumn2(label: Text('Amount')),
        DataColumn2(label: Text('Total')),
        DataColumn2(label: Text('Actions'), fixedWidth: 100),
      ],
      source: OrderRows(),
    );
  }
}
