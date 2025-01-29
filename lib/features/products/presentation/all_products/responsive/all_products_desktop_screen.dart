import 'package:ecommerce_flutter_web/common/widgets/breadcrumbs_with_heading.dart';
import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/all_categories/widgets/category_table_header.dart';
import 'package:ecommerce_flutter_web/features/products/presentation/all_products/widgets/products_table.dart';
import 'package:flutter/material.dart';

class AllProductsDesktopScreen extends StatelessWidget {
  const AllProductsDesktopScreen({super.key});

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
                heading: " Products",
                breadcrumbs: ["Products", "All Products"],
              ),
              SizedBox(height: AppSizes.spaceBtwSections),
              AppRoundedContainer(
                child: CategoryTableHeader(
                  buttonText: "Add Product",
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwItems),
              ProductsTable(),
            ],
          ),
        ),
      ),
    );
  }
}
