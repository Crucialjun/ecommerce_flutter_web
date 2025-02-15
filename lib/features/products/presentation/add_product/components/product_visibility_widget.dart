import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class ProductVisibilityWidget extends StatelessWidget {
  const ProductVisibilityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Visibility",
              style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(
            height: AppSizes.spaceBtwItems,
          ),
          Column(children: [
            _buildVisibilityRadioButton(
              "published",
              "Published"
            ),
            _buildVisibilityRadioButton(
              "hidden",
              "Hidden"
            ),
          ],)
        ],
      ),
    );
  }
  
  _buildVisibilityRadioButton(
  String value,String label
  ) {
    return RadioMenuButton(value: value, groupValue: "published", onChanged: (value){}, child: Text(label));
  }
}
