import 'package:ecommerce_flutter_web/features/customers/presentation/all_customers/responsive/all_customers_desktop_screen.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

class AllCustomersScreen extends StatelessWidget {
  static const String routeName = "/all-customers";
  const AllCustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      desktop: AllCustomersDesktopScreen(),
    );
  }
}
