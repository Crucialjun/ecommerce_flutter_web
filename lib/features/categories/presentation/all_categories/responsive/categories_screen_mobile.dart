import 'package:ecommerce_flutter_web/common/widgets/breadcrumbs_with_heading.dart';
import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/all_categories/widgets/category_table.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/all_categories/widgets/category_table_header.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/create_category/create_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreenMobile extends StatelessWidget {
  const CategoriesScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Breadcrumbs
                BreadcrumbsWithHeading(
                  heading: "Categories",
                  breadcrumbs: ["Categories"],
                ),
                const SizedBox(height: AppSizes.spaceBtwSections),
                AppRoundedContainer(
                  child: Column(
                    children: [
                      CategoryTableHeader(
                        onPressed: () =>
                            Get.toNamed(CreateCategoryScreen.route),
                        buttonText: "Create New Category",
                      ),
                      SizedBox(height: AppSizes.spaceBtwItems),
                      CategoryTable()
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
