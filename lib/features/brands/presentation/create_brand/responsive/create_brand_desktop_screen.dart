import 'package:ecommerce_flutter_web/common/widgets/breadcrumbs_with_heading.dart';
import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/brands/presentation/create_brand/widgets/create_brand_form.dart';
import 'package:flutter/material.dart';

class CreateBrandDesktopScreen extends StatelessWidget {
  const CreateBrandDesktopScreen({super.key});

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
                heading: "Create Brand",
                breadcrumbs: ["Brands", "Create Brand"],
              ),
              SizedBox(height: AppSizes.spaceBtwSections),
              AppRoundedContainer(
                child: Column(
                  children: [
                    CreateBrandForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}