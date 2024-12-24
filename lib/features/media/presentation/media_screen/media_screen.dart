import 'package:ecommerce_flutter_web/features/media/presentation/media_screen/responsive/media_desktop_screen.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

class MediaScreen extends StatelessWidget {
  static const String routeName = '/media';
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      desktop: MediaDesktopScreen(),
    );
  }
}
