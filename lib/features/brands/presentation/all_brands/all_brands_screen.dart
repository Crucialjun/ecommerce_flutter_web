import 'package:ecommerce_flutter_web/features/brands/presentation/all_brands/responsive/all_brands_desktop_screen.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

class AllBrandsScreen extends StatelessWidget {
  static const String route = '/brands';
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      desktop: AllBrandsDesktopScreen(),
    );
  }
}
