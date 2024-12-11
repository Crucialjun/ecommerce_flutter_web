import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = '/';
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
        desktop: Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PaginatedDataTable2(
          source: MyData(data: [
            ['1', '2'],
            ['3', '4'],
            ['5', '6'],
            ['7', '8'],
            ['9', '10'],
            ['11', '12'],
            ['13', '14'],
            ['15', '16'],
            ['17', '18'],
            ['19', '20'],
            ['21', '22'],
            ['23', '24'],
            ['25', '26'],
            ['27', '28'],
            ['29', '30'],
            ['31', '32'],
            ['33', '34'],
            ['35', '36'],
            ['37', '38'],
            ['39', '40'],
            ['41', '42'],
            ['43', '44'],
            ['45', '46'],
            ['47', '48'],
            ['49', '50'],
            ['51', '52'],
            ['53', '54'],
            ['55', '56'],
            ['57', '58'],
            ['59', '60'],
            ['61', '62'],
            ['63', '64'],
            ['65', '66'],
            ['67', '68'],
            ['69', '70'],
            ['71', '72'],
            ['73', '74'],
            ['75', '76'],
            ['77', '78'],
            ['79', '80'],
            ['81', '82'],
            ['83', '84'],
            ['85', '86'],
            ['87', '88'],
            ['89', '90'],
            ['91', '92'],
            ['93', '94'],
            ['95', '96'],
            ['97', '98'],
            ['99', '100'],
          ]),
          columnSpacing: 12,
          minWidth: 786,
          dividerThickness: 0,
          horizontalMargin: 12,
          dataRowHeight: 56,
          headingTextStyle: Theme.of(context).textTheme.titleMedium,
          headingRowColor:
              const WidgetStatePropertyAll(AppColors.primaryBackground),
          headingRowDecoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppSizes.borderRadiusMd),
              topRight: Radius.circular(AppSizes.borderRadiusMd),
            ),
            border: Border(
              bottom: BorderSide(color: AppColors.grey.withOpacity(0.5)),
            ),
          ),
          showCheckboxColumn: true,
          columns: const [
            DataColumn(
              label: Text('Column 1'),
            ),
            DataColumn(
              label: Text('Column 2'),
            ),
          ],
        ),
      )),
    ));
  }
}

class MyData extends DataTableSource {
  MyData({required this.data});

  final List<List<String>> data;

  @override
  DataRow getRow(int index) {
    return DataRow2.byIndex(
      onTap: () {
        print('Tapped $index');
      },
      onSelectChanged: (value) {
        print('Selected $index');
      },
      selected: true,
      index: index,
      cells: [
        DataCell(Text(data[index][0])),
        DataCell(Text(data[index][1])),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
