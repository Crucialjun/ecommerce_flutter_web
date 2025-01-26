import 'package:ecommerce_flutter_web/features/banners/presentation/edit_banner/responsive/edit_banner_desktop_screen.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

class EditBannerScreen extends StatelessWidget {
  static const String routeName = '/edit-banner';
  const EditBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      desktop: EditBannerDesktopScreen(),
    );
  }
}
