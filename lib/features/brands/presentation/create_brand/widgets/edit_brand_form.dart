import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_assets.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class EditBrandForm extends StatelessWidget {
  const EditBrandForm({super.key});

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
            "Edit  Brand",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: AppSizes.spaceBtwSections),
          TextField(
            decoration: InputDecoration(
              labelText: "Brand Name",
              hintText: "Enter brand name",
              prefixIcon: Icon(Icons.branding_watermark),
            ),
          ),
          SizedBox(height: AppSizes.spaceBtwInputFields),
          Text(
            "Select Categories",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: AppSizes.spaceBtwInputFields / 2),
          Wrap(
            spacing: AppSizes.sm,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: AppSizes.sm),
                  child: ChoiceChip(
                    selected: true,
                    onSelected: (value) {},
                    label: Text("Shoes"),
                    padding: EdgeInsets.all(AppSizes.xs),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: AppSizes.sm),
                  child: ChoiceChip(
                    selected: false,
                    onSelected: (value) {},
                    label: Text("Track Suits"),
                    padding: EdgeInsets.all(AppSizes.xs),
                  )),
            ],
          ),
          SizedBox(height: AppSizes.spaceBtwInputFields * 2),
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
              child: ElevatedButton(onPressed: () {}, child: Text("Update"))),
          SizedBox(height: AppSizes.spaceBtwInputFields * 2),
        ],
      )),
    );
  }
}
