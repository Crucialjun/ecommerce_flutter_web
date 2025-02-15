import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AppPaginatedDataTable extends StatelessWidget {
  const AppPaginatedDataTable(
      {super.key,
      this.sortAscending = true,
      required this.source,
      required this.columns,
      this.sortColumnIndex,
      this.rowsPerPage = 10,
      this.tableHeight = 760,
      this.dataRowHeight = AppSizes.xl * 2,
      this.onPageChanged,
      this.minWidth = 1000});

  final bool sortAscending;
  final DataTableSource source;
  final List<DataColumn> columns;
  final int? sortColumnIndex;
  final int rowsPerPage;
  final double tableHeight;
  final double dataRowHeight;
  final Function(
    int,
  )? onPageChanged;

  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSizes.borderRadiusMd),
        ),
      ),
      height: tableHeight,
      child: PaginatedDataTable2(
        columnSpacing: 12,
        dividerThickness: 0,
        horizontalMargin: 12,
        showFirstLastButtons: true,
        showCheckboxColumn: true,
        renderEmptyRowsInTheEnd: false,
        onRowsPerPageChanged: (value) {},
        headingTextStyle: Theme.of(context).textTheme.titleMedium,
        headingRowColor:
            const WidgetStatePropertyAll(AppColors.primaryBackground),
        sortAscending: sortAscending,
        sortColumnIndex: sortColumnIndex,
        rowsPerPage: rowsPerPage,
        source: source,
        dataRowHeight: dataRowHeight,
        columns: columns,
        onPageChanged: onPageChanged,
        minWidth: minWidth,
        empty: Center(
          child: Text('No data found'),
        ),
        headingRowDecoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSizes.borderRadiusMd),
            topRight: Radius.circular(AppSizes.borderRadiusMd),
          ),
        ),
      ),
    );
  }
}
