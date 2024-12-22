import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/table/table_sources.dart';
import 'package:flutter/material.dart';

class DashboardOrderTable extends StatelessWidget {
  const DashboardOrderTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PaginatedDataTable2(
        columns: [
          DataColumn2(
            label: Text('Order ID'),
          ),
          DataColumn2(
            label: Text('Date'),
          ),
          DataColumn2(
            label: Text('Items'),
          ),
          DataColumn2(
            label: Text('Status'),
          ),
          DataColumn2(
            label: Text('Amount'),
          ),
        ],
        source: OrderRows(),
        rowsPerPage: 10,
        dataRowHeight: AppSizes.xl * 1.2,
        sortAscending: true,
        minWidth: 700,
      ),
    );
  }
}
