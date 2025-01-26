import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_assets.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class CreateBannerForm extends StatelessWidget {
  const CreateBannerForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRoundedContainer(
      width: 500,
      padding: EdgeInsets.all(AppSizes.defaultSpace),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSizes.sm),
          Text(
            "Create New Banner",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: AppSizes.spaceBtwSections),
          Column(
            children: [
              GestureDetector(
                child: ExtendedImage.asset(
                  AppAssets.defaultProfile,
                  width: 400,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwItems),
              TextButton(
                onPressed: () {},
                child: Text("Select Image"),
              ),
            ],
          ),
          SizedBox(height: AppSizes.spaceBtwInputFields),
          Text("Make your Banner Active or Inactive",
              style: Theme.of(context).textTheme.bodyMedium),
          CheckboxMenuButton(
              value: true, onChanged: (value) {}, child: Text("Active")),
          SizedBox(height: AppSizes.spaceBtwInputFields),
          DropdownButton(items: [
            DropdownMenuItem(value: "Home", child: Text("Home")),
            DropdownMenuItem(value: "Search", child: Text("Search")),
          ], onChanged: (value) {}, value: "Search"),
          SizedBox(height: AppSizes.spaceBtwInputFields * 2),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Create Banner"),
            ),
          ),
        ],
      )),
    );
  }
}
