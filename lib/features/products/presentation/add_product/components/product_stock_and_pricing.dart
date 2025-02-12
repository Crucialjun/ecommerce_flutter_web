import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ProductStockAndPricing extends StatelessWidget {
  const ProductStockAndPricing({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        child: Column(
      children: [
        FractionallySizedBox(
          widthFactor: 0.45,
          child: FormBuilderTextField(
            name: 'stock',
            decoration: InputDecoration(
                labelText: 'Stock',
                hintText: 'Add Stock , only numbers are allowed'),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
            ]),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
        SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        Row(
          children: [
            Expanded(
                child: FormBuilderTextField(
                    name: 'price',
                    decoration: InputDecoration(
                      labelText: 'Price',
                      hintText: 'Price with up to 2 decimal points',
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric()
                    ]))),
            SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            Expanded(
                child: FormBuilderTextField(
                    name: 'discountedPrice',
                    decoration: InputDecoration(
                      labelText: 'Discounted Price',
                      hintText: 'Price with up to 2 decimal points',
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric()
                    ]))),
          ],
        )
      ],
    ));
  }
}
