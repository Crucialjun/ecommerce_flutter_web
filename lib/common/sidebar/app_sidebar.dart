import 'package:ecommerce_flutter_web/common/sidebar/sidebar_menu_item.dart';
import 'package:ecommerce_flutter_web/constants/app_assets.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.grey, width: 1),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExtendedImage.asset(
                AppAssets.logoBlack,
                width: 100,
                height: 100,
                shape: BoxShape.circle,
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "MENU",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(letterSpacingDelta: 1.2),
                    ),
                    const SidebarMenuItem(
                      route: "/",
                      icon: Iconsax.status,
                      title: "Dashboard",
                    ),
                    const SidebarMenuItem(
                      route: "/media",
                      icon: Iconsax.image,
                      title: "Media",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
