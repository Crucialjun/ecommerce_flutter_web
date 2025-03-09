import 'package:ecommerce_flutter_web/common/widgets/breadcrumbs_with_heading.dart';
import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/orders/presentation/all_orders/widgets/orders_table.dart';
import 'package:flutter/material.dart';

class AllOrdersDesktopScreen extends StatelessWidget {
  const AllOrdersDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding:EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BreadcrumbsWithHeading(
                breadcrumbs: [ 'Orders'],
                heading: 'Orders',
              ),
              SizedBox(height: AppSizes.spaceBtwItems),
              AppRoundedContainer(
                child: Column(
                  children: [
                    Text('All Orders'),
                    SizedBox(height: AppSizes.spaceBtwItems),
                    OrdersTable(),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}