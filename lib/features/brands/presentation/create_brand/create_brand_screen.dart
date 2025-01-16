import 'package:ecommerce_flutter_web/features/brands/presentation/create_brand/responsive/create_brand_desktop_screen.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

class CreateBrandScreen extends StatelessWidget {
  static const String route = '/brands/create';
  const CreateBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      desktop: CreateBrandDesktopScreen(),
    );
  }
}
