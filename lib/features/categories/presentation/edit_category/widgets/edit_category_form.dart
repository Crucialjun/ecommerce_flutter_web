import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_assets.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class EditCategoryForm extends StatelessWidget {
  const EditCategoryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRoundedContainer(
      width: 500,
      padding: EdgeInsets.all(AppSizes.defaultSpace),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Heading
          SizedBox(height: AppSizes.sm),
          Text("Update Category",
              style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(height: AppSizes.spaceBtwSections),

          //Name Text Field
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter category name';
              }
              return null;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.category),
              labelText: "Category Name",
            ),
          ),
          SizedBox(height: AppSizes.spaceBtwInputFields),

          DropdownButtonFormField(
              decoration: InputDecoration(
                hintText: "Parent Category",
                prefixIcon: Icon(Icons.category),
                labelText: "Parent Category",
              ),
              items: [
                DropdownMenuItem(
                    value: "",
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [Text("Item Name")],
                    )),
              ],
              onChanged: (newValue) {}),

          Stack(
            children: [
              ExtendedImage.asset(
                AppAssets.defaultProfile,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),

          CheckboxMenuButton(
              value: true, onChanged: (value) {}, child: Text("Featured")),
          SizedBox(height: AppSizes.spaceBtwInputFields * 2),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Create"),
            ),
          ),

          SizedBox(height: AppSizes.spaceBtwInputFields * 2),
        ],
      )),
    );
  }
}
