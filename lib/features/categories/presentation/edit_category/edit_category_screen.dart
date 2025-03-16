import 'package:ecommerce_flutter_web/features/categories/presentation/data/models/category_model.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/edit_category/responsive/edit_category_desktop_screen.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';


class EditCategoryScreen extends StatelessWidget {
  static const route = "/edit-category";
  const EditCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = CategoryModel();
    return SiteTemplate(
      desktop: EditCategoryDesktopScreen(
        category: category,
      ),
    );
  }
}
