import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ProductTitleAndDescription extends StatelessWidget {
  const ProductTitleAndDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRoundedContainer(
      child: FormBuilder(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Basic Information",
              style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(
            height: AppSizes.spaceBtwItems,
          ),
          FormBuilderTextField(
            name: "title",
            decoration: InputDecoration(labelText: "Product Title"),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
          ),
          SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          SizedBox(
            height: 300,
            child: FormBuilderTextField(
              name: "description",
              expands: true,
              textAlign: TextAlign.start,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                  labelText: "Product Description",
                  hintText: "Add your product description here",
                  alignLabelWithHint: true),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
          )
        ],
      )),
    );
  }
}
