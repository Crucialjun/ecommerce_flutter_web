import 'package:ecommerce_flutter_web/features/banners/presentation/all_banners/responsive/all_banners_desktop_screen.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

class AllBannersScreen extends StatelessWidget {
  static const String route = '/banners';
  const AllBannersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      desktop: AllBannersDesktopScreen(),
    );
  }
}
