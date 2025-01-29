import 'package:ecommerce_flutter_web/features/products/presentation/all_products/responsive/all_products_desktop_screen.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  static const routeName = '/products';
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(desktop: AllProductsDesktopScreen());
  }
}
