import 'package:ecommerce_flutter_web/common/widgets/breadcrumbs_with_heading.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class CreateCategoryDesktopScreen extends StatelessWidget {
  const CreateCategoryDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BreadcrumbsWithHeading(
              returnToPrevious: true,
              heading: "Create Category",
              breadcrumbs: ["Categories", "Create Category"],
            ),
            SizedBox(height: AppSizes.spaceBtwSections),
            // CreateCategoryForm(),
          ],
        ),
      ),
    ));
  }
}
