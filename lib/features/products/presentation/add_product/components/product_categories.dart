import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class ProductCategories extends StatelessWidget {
  const ProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Categories",
              style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(
            height: AppSizes.spaceBtwItems,
          ),
          MultiSelectDialogField(items: [
            MultiSelectItem("Category 1", "Category 1"),
            MultiSelectItem("Category 2", "Category 2"),
            MultiSelectItem("Category 3", "Category 3"),
          ], onConfirm: (values) {
            print(values);
          },
          listType: MultiSelectListType.CHIP,
          
          ),
          
        ],
      ),
    );
  }
}
