import 'package:ecommerce_flutter_web/common/sidebar/sidebar_controller.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SidebarMenuItem extends StatelessWidget {
  const SidebarMenuItem({
    super.key,
    required this.route,
    required this.icon,
    required this.title,
  });

  final String route;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SidebarController());

    return InkWell(
      onTap: () => controller.menuOnTap(route),
      onHover: (value) {
        if (value) {
          controller.setHoverItem(route);
        } else {
          controller.setHoverItem("");
        }
      },
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Container(
            decoration: BoxDecoration(
              color: controller.isActive(route)
                  ? AppColors.primary
                  : controller.isHover(route)
                      ? AppColors.primary
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, top: 8, bottom: 8, right: 16),
                  child: Icon(
                    icon,
                    size: 22,
                    color: controller.isActive(route)
                        ? AppColors.white
                        : controller.isHover(route)
                            ? AppColors.white
                            : AppColors.darkGrey,
                  ),
                ),
                Text(title,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: controller.isActive(route)
                            ? AppColors.white
                            : controller.isHover(route)
                                ? AppColors.white
                                : AppColors.darkGrey)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
