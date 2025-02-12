import 'package:ecommerce_flutter_web/features/products/presentation/add_product/responsive/add_product_desktop_screen.dart';
import 'package:ecommerce_flutter_web/features/products/presentation/add_product/responsive/add_product_mobile_screen.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  static const routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      desktop: AddProductDesktopScreen(),
      mobile: AddProductMobileScreen(),
    );
  }
}
