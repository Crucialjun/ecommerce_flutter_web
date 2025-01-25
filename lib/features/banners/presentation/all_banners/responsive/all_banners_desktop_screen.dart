import 'package:ecommerce_flutter_web/common/widgets/breadcrumbs_with_heading.dart';
import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/banners/presentation/all_banners/widgets/banners_table.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/all_categories/widgets/category_table_header.dart';
import 'package:flutter/material.dart';

class AllBannersDesktopScreen extends StatelessWidget {
  const AllBannersDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              BreadcrumbsWithHeading(
                //returnToPrevious: true,
                heading: "Banners",
                breadcrumbs: ["Banners"],
              ),
              SizedBox(height: AppSizes.spaceBtwSections),
              AppRoundedContainer(
                child: Column(
                  children: [
                    CategoryTableHeader(
                        buttonText: "Create New Banner", onPressed: () {}),
                    SizedBox(height: AppSizes.spaceBtwItems),
                    BannersTable(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
