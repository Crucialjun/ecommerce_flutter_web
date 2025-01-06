import 'package:ecommerce_flutter_web/common/data/models/image_model.dart';
import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_assets.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:ecommerce_flutter_web/features/media/presentation/controller/media_controller.dart';
import 'package:ecommerce_flutter_web/features/media/presentation/media_screen/widgets/image_popup.dart';
import 'package:ecommerce_flutter_web/features/media/presentation/media_screen/widgets/media_folder_dropdown.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

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
                    mediaController.getMediaImages();
                  }
                },
              ),
            ],
          ),

          SizedBox(
            height: AppSizes.spaceBtwSections,
          ),

          // Show media

          Obx(() {
            List<ImageModel> images = getSelectedFolderImages(mediaController);

            if (mediaController.loading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (images.isEmpty) {
              return Center(
                child: Text('No images found'),
              );
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                    alignment: WrapAlignment.start,
                    spacing: AppSizes.spaceBtwItems / 2,
                    runSpacing: AppSizes.spaceBtwItems / 2,
                    children: images.map((e) {
                      return GestureDetector(
                        onTap: () {
                          Get.dialog(
                            ImagePopup(
                              image: e,
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 140,
                          height: 180,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(AppSizes.sm),
                                decoration: BoxDecoration(
                                    color: AppColors.primaryBackground),
                                child: ExtendedImage.network(
                                  e.url,
                                  width: 140,
                                  height: 120,
                                  fit: BoxFit.contain,
                                  shape: BoxShape.circle,
                                  loadStateChanged: (state) {
                                    if (state.extendedImageLoadState ==
                                        LoadState.loading) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else if (state.extendedImageLoadState ==
                                        LoadState.failed) {
                                      Logger()
                                          .e('Error loading image: ${e.url}');
                                      return Center(
                                        child: Icon(
                                          Icons.error,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error,
                                        ),
                                      );
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.all(AppSizes.sm),
                                child: Text(
                                  e.fileName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                            ],
                          ),
                        ),
                      );
                    }).toList()),
                if (!mediaController.loading.value)
                  Padding(
                      padding: EdgeInsets.all(AppSizes.spaceBtwSections),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: AppSizes.buttonWidth,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                mediaController.loadMoreImages();
                              },
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
            );
          }),
        ],
      ),
    );
  }

  List<ImageModel> getSelectedFolderImages(MediaController mediaController) {
    switch (mediaController.selectedFolder.value) {
      case "products":
        return mediaController.allProductImages;
      case "banners":
        return mediaController.allBannerImages;
      case "brands":
        return mediaController.allBrandImages;
      case "categories":
        return mediaController.allCategoryImages;
      case "users":
        return mediaController.allUserImages;
      default:
        return mediaController.allImages;
    }
  }
}
