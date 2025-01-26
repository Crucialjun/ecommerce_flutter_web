import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_flutter_web/features/banners/presentation/edit_banner/edit_banner_screen.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow2(cells: [
      DataCell(
        ExtendedImage.network(
          'https://picsum.photos/250?image=9',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
          shape: BoxShape.circle,
        ),
      ),
      DataCell(Text('Shop')),
      DataCell(Icon(Icons.remove_red_eye_outlined)),
      DataCell(Row(
        children: [
          InkWell(
              onTap: () {
                Get.toNamed(EditBannerScreen.routeName);
              },
              child: Icon(Icons.edit)),
          SizedBox(width: 10),
          Icon(Icons.delete),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 10;

  @override
  int get selectedRowCount => 0;
}
