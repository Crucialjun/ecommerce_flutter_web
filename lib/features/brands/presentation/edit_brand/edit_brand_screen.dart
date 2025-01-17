import 'package:ecommerce_flutter_web/features/brands/presentation/edit_brand/responsive/edit_brand_desktop_screen.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

class EditBrandScreen extends StatelessWidget {
  static const String route = '/brands/edit';
  const EditBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      desktop: EditBrandDesktopScreen(),
    );
  }
}