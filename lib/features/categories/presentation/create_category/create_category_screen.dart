import 'package:ecommerce_flutter_web/features/categories/presentation/create_category/responsive/create_category_desktop_screen.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/create_category/responsive/create_category_tablet_screen.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/create_category/responsive/create_cateory_mobile_screen.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

class CreateCategoryScreen extends StatelessWidget {
  static const String route = '/categories/create';
  const CreateCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      desktop: CreateCategoryDesktopScreen(),
      tablet: CreateCategoryTabletScreen(),
      mobile: CreateCategoryMobileScreen(),
    );
  }
}
