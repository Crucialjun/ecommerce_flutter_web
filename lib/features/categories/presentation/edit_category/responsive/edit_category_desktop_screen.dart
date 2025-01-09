import 'package:ecommerce_flutter_web/common/widgets/breadcrumbs_with_heading.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/data/models/category_model.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/edit_category/widgets/edit_category_form.dart';
import 'package:flutter/material.dart';

class EditCategoryDesktopScreen extends StatelessWidget {
  const EditCategoryDesktopScreen({super.key, required this.category});

  final CategoryModel category;

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
              heading: "Edit Category",
              breadcrumbs: ["Categories", "Edit Category"],
            ),
            SizedBox(height: 20),
            EditCategoryForm(),
          ],
        ),
      ),
    ));
  }
}
