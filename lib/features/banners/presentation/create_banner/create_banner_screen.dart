import 'package:ecommerce_flutter_web/features/banners/presentation/create_banner/responsive/create_banner_desktop_screen.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

class CreateBannerScreen extends StatelessWidget {
  static const String routeName = '/create-banner';
  const CreateBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      desktop: CreateBannerDesktopScreen(),
    );
  }
}
