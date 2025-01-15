import 'package:ecommerce_flutter_web/utils/paginated_data_table.dart';
import 'package:flutter/material.dart';

class BrandTable extends StatelessWidget {
  const BrandTable({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPaginatedDataTable(
     
      columns: const [
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Description')),
        DataColumn(label: Text('Actions')),
      ],
      source: BrandDataSource(),
    );
  }
}