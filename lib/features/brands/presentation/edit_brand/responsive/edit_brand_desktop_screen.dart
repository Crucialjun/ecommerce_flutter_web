import 'package:ecommerce_flutter_web/common/widgets/breadcrumbs_with_heading.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';

import 'package:ecommerce_flutter_web/features/brands/presentation/create_brand/widgets/edit_brand_form.dart';
import 'package:flutter/material.dart';

class EditBrandDesktopScreen extends StatelessWidget {
  const EditBrandDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BreadcrumbsWithHeading(
                returnToPrevious: true,
                heading: "Edit Brand",
                breadcrumbs: ["Brands", "Edit Brand"],
              ),
              SizedBox(height: AppSizes.spaceBtwSections),
              EditBrandForm(),
            ],
          ),
        ),
      ),
    );
  }
}
