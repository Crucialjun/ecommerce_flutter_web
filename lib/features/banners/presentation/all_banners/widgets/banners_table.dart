import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/features/banners/presentation/all_banners/widgets/banner_rows.dart';
import 'package:flutter/material.dart';

class BannersTable extends StatelessWidget {
  const BannersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRoundedContainer(
      height: 900,
      child: PaginatedDataTable2(
          minWidth: 700,
          dataRowHeight: 110,
          columns: [
            DataColumn2(
              label: Text('Banner'),
            ),
            DataColumn2(
              label: Text('Redirect Screen'),
            ),
            DataColumn2(
              label: Text('Active'),
            ),
            DataColumn2(label: Text('Actions'), fixedWidth: 100),
          ],
          source: BannerRows()),
    );
  }
}
