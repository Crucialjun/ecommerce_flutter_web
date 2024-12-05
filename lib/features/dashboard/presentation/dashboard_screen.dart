import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = '/';
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteTemplate(
      desktop: Center(
        child: Text('Dashboard Screen'),
      ),
    );
  }
}
