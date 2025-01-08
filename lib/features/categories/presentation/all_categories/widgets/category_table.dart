import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/all_categories/widgets/category_rows.dart';
import 'package:flutter/material.dart';

class CategoryTable extends StatelessWidget {
  const CategoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRoundedContainer(
      backgroundColor: Colors.white,
      width: double.infinity,
      child: PaginatedDataTable(
        header: Text("Categories"),
        columns: [
          DataColumn2(label: Text("Category")),
          DataColumn2(label: Text("Parent Category")),
          DataColumn2(label: Text("Featured")),
          DataColumn2(label: Text("Date")),
          DataColumn2(label: Text("Actions"), fixedWidth: 100),
        ],
        source: CategoryRows(),
      ),
    );
  }
}
