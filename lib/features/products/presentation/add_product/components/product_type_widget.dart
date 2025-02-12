import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class ProductTypeWidget extends StatelessWidget {
  const ProductTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Product Type"),
        SizedBox(width: AppSizes.spaceBtwItems),
        RadioMenuButton(
            value: "Single",
            groupValue: "Single",
            onChanged: (value) {},
            child: Text("Single")),
        RadioMenuButton(
            value: "Variable",
            groupValue: "Single",
            onChanged: (value) {},
            child: Text("Variable")),
      ],
    );
  }
}
