import 'package:ecommerce_flutter_web/common/data/models/image_model.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class MediaImagesListItemWithCheckbox extends StatelessWidget {
  const MediaImagesListItemWithCheckbox(
      {super.key,
      required this.image,
      required this.selectedImages,
      required this.allowMultipleSelection});

  final ImageModel image;
  final List<ImageModel> selectedImages;
  final bool allowMultipleSelection;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(AppSizes.sm),
          decoration: BoxDecoration(color: AppColors.primaryBackground),
          child: ExtendedImage.network(
            image.url,
            width: 140,
            height: 120,
            fit: BoxFit.contain,
            shape: BoxShape.circle,
            loadStateChanged: (state) {
              if (state.extendedImageLoadState == LoadState.loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.extendedImageLoadState == LoadState.failed) {
                Logger().e('Error loading image: ${image.url}');
                return Center(
                  child: Icon(
                    Icons.error,
                    color: Theme.of(context).colorScheme.error,
                  ),
                );
              }
              return null;
            },
          ),
        ),
        Positioned(
          top: AppSizes.md,
          right: AppSizes.md,
          child: Obx(() => Checkbox(
                value: image.isSelected.value,
                onChanged: (value) {
                  if (value != null) {
                    image.isSelected.value = value;
                    if (value) {
                      selectedImages.add(image);

                      if (!allowMultipleSelection) {
                        for (var i = 0; i < selectedImages.length; i++) {
                          if (selectedImages[i] != image) {
                            selectedImages[i].isSelected.value = false;
                            selectedImages.removeAt(i);
                          }
                        }
                      }
                    } else {
                      selectedImages.remove(image);
                    }
                  }
                },
              )),
        ),
      ],
    );
  }
}
