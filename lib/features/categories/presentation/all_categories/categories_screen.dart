import 'package:ecommerce_flutter_web/features/categories/presentation/all_categories/responsive/categories_screen_desktop.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/all_categories/responsive/categories_screen_mobile.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/all_categories/responsive/categories_screen_tablet.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  static const route = '/categories';
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      desktop: CategoriesScreenDesktop(),
      tablet: CategoriesScreenTablet(),
      mobile: CategoriesScreenMobile(),
    );
  }
}
