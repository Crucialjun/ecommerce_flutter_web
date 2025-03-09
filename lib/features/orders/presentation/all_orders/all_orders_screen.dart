import 'package:ecommerce_flutter_web/features/orders/presentation/all_orders/responsive/all_orders_desktop_screen.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

class AllOrdersScreen extends StatelessWidget {
  const AllOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      desktop: AllOrdersDesktopScreen(),
    );
  }
}
