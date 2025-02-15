import 'package:ecommerce_flutter_web/constants/app_assets.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';

import 'package:ecommerce_flutter_web/features/user_controller.dart';
import 'package:ecommerce_flutter_web/utils/device/device_utility.dart';
import 'package:ecommerce_flutter_web/utils/shimmer_effect.dart';
import 'package:extended_image/extended_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:logger/logger.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final userController = UserController.to;
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.md, vertical: AppSizes.sm),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.grey.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
      ),
      child: AppBar(
        leading: AppDeviceUtils.isDesktopScreen(context)
            ? null
            : IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
              ),
        title: AppDeviceUtils.isDesktopScreen(context)
            ? SizedBox(
                width: 400,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: AppColors.lightGrey,
                  ),
                ),
              )
            : null,
        actions: [
          AppDeviceUtils.isDesktopScreen(context)
              ? Container()
              : IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          const SizedBox(width: AppSizes.spaceBtwItems / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => ExtendedImage.network(
                    userController.appuser.value.profilePicture,
                    width: 40,
                    height: 40,
                    shape: BoxShape.circle,
                    loadStateChanged: (state) {
                      Logger().i("state: ${state.extendedImageLoadState}");
                      if (state.extendedImageLoadState == LoadState.loading) {
                        return const CircularProgressIndicator();
                      } else if (state.extendedImageLoadState ==
                          LoadState.failed) {
                        ExtendedImage.asset(
                          AppAssets.defaultProfile,
                          width: 40,
                          height: 40,
                          shape: BoxShape.circle,
                        );
                      }
                      Image.asset(
                        AppAssets.defaultProfile,
                        width: 40,
                        height: 40,
                      );
                      return null;
                    },
                  )),
              if (!AppDeviceUtils.isMobileScreen(context))
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    userController.isLoading.value
                        ? const AppShimmerEffect(
                            height: 13,
                            width: 50,
                          )
                        : Text(userController.appuser.value.firstName,
                            style: Theme.of(context).textTheme.titleLarge),
                    userController.isLoading.value
                        ? const AppShimmerEffect(
                            height: 13,
                            width: 50,
                          )
                        : Text('nich.otieno@gmail.com',
                            style: Theme.of(context).textTheme.labelMedium),
                  ],
                ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppDeviceUtils.getAppBarHeight() + 15);
}
