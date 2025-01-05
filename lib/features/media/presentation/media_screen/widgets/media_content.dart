import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_assets.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/media/presentation/controller/media_controller.dart';
import 'package:ecommerce_flutter_web/features/media/presentation/media_screen/widgets/media_folder_dropdown.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class MediaContent extends StatelessWidget {
  const MediaContent({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaController = MediaController.instance;
    return AppRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //MEdia Images header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Folders Dropdown
              Text(
                'Selected Folder',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                width: AppSizes.spaceBtwItems,
              ),
              MediaFolderDropdown(
                onSelected: (p0) {
                  if (p0 != null) {
                    mediaController.selectedFolder.value = p0;
                  }
                },
              ),
            ],
          ),

          SizedBox(
            height: AppSizes.spaceBtwSections,
          ),

          // Show media

          Wrap(
            alignment: WrapAlignment.start,
            spacing: AppSizes.spaceBtwItems / 2,
            runSpacing: AppSizes.spaceBtwItems / 2,
            children: [
              Container(
                padding: EdgeInsets.all(AppSizes.sm),
                decoration: BoxDecoration(color: AppColors.primaryBackground),
                child: ExtendedImage.asset(
                  AppAssets.defaultProfile,
                  width: 90,
                  height: 90,
                  fit: BoxFit.contain,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                padding: EdgeInsets.all(AppSizes.sm),
                decoration: BoxDecoration(color: AppColors.primaryBackground),
                child: ExtendedImage.asset(
                  AppAssets.defaultProfile,
                  width: 90,
                  height: 90,
                  fit: BoxFit.contain,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                padding: EdgeInsets.all(AppSizes.sm),
                decoration: BoxDecoration(color: AppColors.primaryBackground),
                child: ExtendedImage.asset(
                  AppAssets.defaultProfile,
                  width: 90,
                  height: 90,
                  fit: BoxFit.contain,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                padding: EdgeInsets.all(AppSizes.sm),
                decoration: BoxDecoration(color: AppColors.primaryBackground),
                child: ExtendedImage.asset(
                  AppAssets.defaultProfile,
                  width: 90,
                  height: 90,
                  fit: BoxFit.contain,
                  shape: BoxShape.circle,
                ),
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.all(AppSizes.spaceBtwSections),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: AppSizes.buttonWidth,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_downward,
                        color: AppColors.white,
                      ),
                      label: Text('Load More'),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
