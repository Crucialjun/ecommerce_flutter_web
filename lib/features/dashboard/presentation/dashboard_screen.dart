import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = '/';
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
        desktop: Scaffold(
            body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),
            Row(
              children: [
                AppRoundedContainer(
                  padding: const EdgeInsets.all(AppSizes.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' Sales',
                        style: Theme.of(context).textTheme.headlineSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: AppSizes.spaceBtwSections),
                      Row(
                        children: [
                          Text(
                            '\$ 256.0',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    )));
  }
}
