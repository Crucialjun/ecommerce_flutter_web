import 'package:ecommerce_flutter_web/common/widgets/breadcrumbs_with_heading.dart';
import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/all_categories/widgets/category_table_header.dart';
import 'package:ecommerce_flutter_web/features/customers/presentation/all_customers/components/customers_table.dart';
import 'package:flutter/material.dart';

class AllCustomersDesktopScreen extends StatelessWidget {
  const AllCustomersDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BreadcrumbsWithHeading(
              
                heading: " Customers",
                breadcrumbs: ["Customers", ],
              ),
              SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              AppRoundedContainer(
                child: Column(children: [
                  CategoryTableHeader(buttonText: "Add Customer",),
                  SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),  
                  CustomersTable()
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}
