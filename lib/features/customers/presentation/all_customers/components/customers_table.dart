import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_flutter_web/features/customers/presentation/all_customers/components/customer_rows.dart';
import 'package:ecommerce_flutter_web/utils/paginated_data_table.dart';
import 'package:flutter/material.dart';

class CustomersTable extends StatelessWidget {
  const CustomersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPaginatedDataTable(minWidth: 700, source: CustomerRows(), columns: [
      DataColumn2(label: Text("Customer")),
      DataColumn2(label: Text("Email")),
      DataColumn2(label: Text("Phone")),
      DataColumn2(label: Text("Registered")),
      DataColumn2(label: Text("Actions",),fixedWidth: 100),
   
    ]);
  }
}
