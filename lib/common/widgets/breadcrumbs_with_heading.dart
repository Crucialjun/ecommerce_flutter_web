import 'package:ecommerce_flutter_web/common/widgets/page_heading.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BreadcrumbsWithHeading extends StatelessWidget {
  const BreadcrumbsWithHeading(
      {super.key,
      this.heading = '',
      this.breadcrumbs = const [],
      this.returnToPrevious = false});

  final String heading;

  final List<String> breadcrumbs;

  final bool returnToPrevious;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () => Get.offAllNamed(DashboardScreen.routeName),
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.xs),
                child: Text(
                  'Dashboard',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(fontWeightDelta: -1),
                ),
              ),
            ),
            for (var i = 0; i < breadcrumbs.length; i++)
              Row(
                children: [
                  Text("/"),
                  const Icon(
                    Icons.chevron_right,
                    size: 16,
                  ),
                  InkWell(
                    onTap: i == breadcrumbs.length - 1
                        ? null
                        : () => Get.offAllNamed(breadcrumbs[i]),
                    child: Padding(
                      padding: const EdgeInsets.all(AppSizes.xs),
                      child: Text(
                        i == breadcrumbs.length - 1
                            ? breadcrumbs[i].capitalize.toString()
                            : capitalize(breadcrumbs[i].substring(1)),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(fontWeightDelta: -1),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Row(
          children: [
            if (returnToPrevious)
              IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back)),
            if (returnToPrevious) const SizedBox(width: AppSizes.spaceBtwItems),
            PageHeading(heading: heading)
          ],
        )
      ],
    );
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
