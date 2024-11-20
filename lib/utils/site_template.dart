import 'package:ecommerce_flutter_web/index/presentation/responsive/index_screen_desktop.dart';
import 'package:ecommerce_flutter_web/index/presentation/responsive/index_screen_mobile.dart';
import 'package:ecommerce_flutter_web/index/presentation/responsive/index_screen_tablet.dart';
import 'package:ecommerce_flutter_web/utils/app_responsive_design.dart';
import 'package:flutter/material.dart';

class SiteTemplate extends StatelessWidget {
  const SiteTemplate(
      {super.key,
      this.desktop,
      this.tablet,
      this.mobile,
      this.useLayout = true});

  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;
  final bool useLayout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AppResponsiveDesign(
      mobile: useLayout
          ? IndexScreenMobile(body: mobile ?? desktop)
          : mobile ?? desktop ?? Container(),
      tablet: useLayout
          ? IndexScreenTablet(body: tablet ?? desktop)
          : tablet ?? desktop ?? Container(),
      desktop: useLayout
          ? IndexScreenDesktop(body: desktop)
          : desktop ?? Container(),
    ));
  }
}
