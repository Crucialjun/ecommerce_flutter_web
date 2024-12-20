import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/responsive/dasboard_tablet_mode.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/responsive/dashboard_desktop_mode.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/responsive/dashboard_mobile_mode.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/widgets/app_dashboard_card.dart';
import 'package:ecommerce_flutter_web/utils/site_template.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = '/';
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      desktop: DashboardDesktop(),
      tablet: DashboardTablet(),
      mobile: DashboardMobile(),
    );
  }
}
