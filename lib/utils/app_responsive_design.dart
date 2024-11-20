import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AppResponsiveDesign extends StatelessWidget {
  const AppResponsiveDesign(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop});

  // Define the widgets for mobile layout
  final Widget mobile;

  // Define the widgets for tablet layout
  final Widget tablet;

  // Define the widgets for desktop layout
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < AppSizes.tabletScreenSize) {
          return mobile;
        } else if (constraints.maxWidth < AppSizes.desktopScreenSize) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
