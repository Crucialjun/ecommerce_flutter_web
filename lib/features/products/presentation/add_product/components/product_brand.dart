import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class ProductBrand extends StatelessWidget {
  const ProductBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Heading
          Text("Product Brand",
              style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(
            height: AppSizes.spaceBtwItems,
          ),
          //Brand
          TypeAheadField(
            builder: (context, controller, focusNode) {
              return TextFormField(
                controller: controller,
                focusNode: focusNode,
                decoration: InputDecoration(
                  hintText: "Select Brand",
                  border: OutlineInputBorder(),
                ),
              );
            },
            itemBuilder: (context, value) {
              return ListTile(
                title: Text(value),
              );
            },
            onSelected: (value) {
              print(value);
            },
            suggestionsCallback: (pattern) {
              return ["Brand 1", "Brand 2", "Brand 3"];
            },
          ),
        
        ],
      ),
    );
  }
}
