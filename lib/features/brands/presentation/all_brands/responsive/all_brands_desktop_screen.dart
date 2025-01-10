import 'package:ecommerce_flutter_web/common/widgets/breadcrumbs_with_heading.dart';
import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/brands/presentation/all_brands/widgets/brand_table.dart';
import 'package:ecommerce_flutter_web/features/brands/presentation/create_brand/create_brand_screen.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/all_categories/widgets/category_table_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsDesktopScreen extends StatelessWidget {
  const AllBrandsDesktopScreen({super.key});

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
              heading: "Brands",
              breadcrumbs: ["Brands"],
            ),
            SizedBox(height: AppSizes.spaceBtwSections),
            AppRoundedContainer(
              child: Column(
                children: [
                  CategoryTableHeader(
                    buttonText: "Create New Brand",
                    onPressed: () => Get.toNamed(CreateBrandScreen.route),
                  ),
                  SizedBox(height: AppSizes.spaceBtwItems),
                  // Brands List
                ],
              ),
            ),
            BrandTable()
          ],
        ),
      ),
    ));
  }
}
