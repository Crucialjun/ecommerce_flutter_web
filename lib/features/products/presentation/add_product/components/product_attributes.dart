import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          color: AppColors.primaryBackground,
        ),
        SizedBox(height: AppSizes.spaceBtwSections),
        Text(
          "Add Product Attributes",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: AppSizes.spaceBtwItems),
        FormBuilder(
            child: AppDeviceUtils.isDesktopScreen(context)
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildAttributeName()),
                      SizedBox(width: AppSizes.spaceBtwItems),
                      Expanded(
                        flex: 2,
                        child: _buildAttributeTextFields(),
                      ),
                      SizedBox(width: AppSizes.spaceBtwItems),
                      _buildAttributeButton()
                    ],
                  )
                : Column(
                    children: [
                      _buildAttributeName(),
                      SizedBox(height: AppSizes.spaceBtwItems),
                      _buildAttributeTextFields(),
                      SizedBox(height: AppSizes.spaceBtwItems),
                      _buildAttributeButton()
                    ],
                  )),
        SizedBox(
          height: AppSizes.spaceBtwSections,
        ),
        Text("All Attributes",
            style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(height: AppSizes.spaceBtwItems),
        AppRoundedContainer(
          backgroundColor: AppColors.primaryBackground,
          child: Column(
            children: [buildAttributesList(context), buildEmptyAttributes()],
          ),
        ),
        SizedBox(
          height: AppSizes.spaceBtwSections,
        ),
        Center(
          child: SizedBox(
            width: 200,
            child: ElevatedButton.icon(
              icon: Icon(Icons.save),
              onPressed: () {},
              label: Text("Save Product"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: AppColors.primary,
                side: BorderSide(color: AppColors.primary, width: 1),
              ),
            ),
          ),
        )
      ],
    );
  }
}

Column buildEmptyAttributes() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          TextButton(
            onPressed: () {},
            child: Text("There are no Attributes added yet"),
          ),
        ],
      ),
      SizedBox(
        height: AppSizes.spaceBtwItems,
      ),
      Text("No Attributes added yet"),
      SizedBox(
        height: AppSizes.spaceBtwItems,
      ),
    ],
  );
}

ListView buildAttributesList(BuildContext context) {
  return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
          ),
          child: ListTile(
            title: Text("Color"),
            subtitle: Text("Green, Orange , Pink"),
            trailing: IconButton(
              color: AppColors.error,
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: AppSizes.spaceBtwItems,
        );
      },
      itemCount: 3);
}

SizedBox _buildAttributeButton() {
  return SizedBox(
    width: 100,
    child: ElevatedButton.icon(
      icon: Icon(Icons.add),
      onPressed: () {},
      label: Text("Add"),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: AppColors.secondary,
        side: BorderSide(color: AppColors.secondary, width: 1),
      ),
    ),
  );
}

SizedBox _buildAttributeTextFields() {
  return SizedBox(
    height: 80,
    child: FormBuilderTextField(
      name: "attributeValues",
      expands: true,
      textAlign: TextAlign.start,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
          labelText: "Attributes",
          hintText: "Add attributes separated by | Example: Red | Blue",
          alignLabelWithHint: true),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
    ),
  );
}

FormBuilderTextField _buildAttributeName() {
  return FormBuilderTextField(
    name: "attributeName",
    decoration: InputDecoration(
        labelText: "Attribute Name", hintText: "Color, Sizes , Material"),
    validator: FormBuilderValidators.compose([
      FormBuilderValidators.required(),
    ]),
  );
}
