import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_assets.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ProductVariations extends StatelessWidget {
  const ProductVariations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Product Variations",
              style: Theme.of(context).textTheme.headlineSmall),
          TextButton(
            onPressed: () {},
            child: Text(
              "Remove Variation",
            ),
          ),
        ],
      ),
      SizedBox(
        height: AppSizes.spaceBtwItems,
      ),
      ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _buildvariationTile();
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: AppSizes.spaceBtwItems,
            );
          },
          itemCount: 2),
      _buildVariationsMessage(),
    ]);
  }
}

_buildVariationsMessage() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.info,
            size: 200,
          ),
          SizedBox(
            width: AppSizes.spaceBtwItems,
          ),
          Text(
            "There are no variations added for this product",
            style: TextStyle(fontSize: 20),
          )
        ],
      )
    ],
  );
}

Widget _buildvariationTile() {
  return ExpansionTile(
    title: Text(
      "Color : Green",
    ),
    backgroundColor: AppColors.lightGrey,
    collapsedBackgroundColor: AppColors.lightGrey,
    childrenPadding: EdgeInsets.all(AppSizes.md),
    expandedCrossAxisAlignment: CrossAxisAlignment.start,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
    ),
    children: [
      Obx(() => AppRoundedContainer(
            child: ExtendedImage.asset(AppAssets.defaultProfile),
          )),
      SizedBox(
        height: AppSizes.spaceBtwItems,
      ),
      Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Price",
              ),
            ),
          ),
          SizedBox(
            width: AppSizes.spaceBtwItems,
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Stock",
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: AppSizes.spaceBtwItems,
      ),
      Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "SKU",
              ),
            ),
          ),
          SizedBox(
            width: AppSizes.spaceBtwItems,
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Barcode",
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
