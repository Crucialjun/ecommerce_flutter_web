import 'package:ecommerce_flutter_web/common/data/models/image_model.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class MediaImagesListItem extends StatelessWidget {
  const MediaImagesListItem({
    super.key,
    required this.image,
  });

  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}