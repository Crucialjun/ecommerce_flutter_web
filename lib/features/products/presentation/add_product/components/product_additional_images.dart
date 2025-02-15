import 'package:ecommerce_flutter_web/common/widgets/rounded_container.dart';
import 'package:ecommerce_flutter_web/constants/app_assets.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAdditionalImages extends StatelessWidget {
  const ProductAdditionalImages(
      {super.key,
      required this.additionalProductImagesURLs,
      required this.onTapToAddImages,
      required this.onTapToDeleteImage});

  final RxList<String> additionalProductImagesURLs;
  final void Function() onTapToAddImages;
  final void Function(int index) onTapToDeleteImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: onTapToAddImages,
                child: AppRoundedContainer(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AppAssets.defaultProfile,
                        width: 50,
                        height: 50,
                      ),
                      Text("Add Additional Product Images"),
                    ],
                  ),
                ),
              )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 80,
                  child: _uploadedImagesOrEmptyList(),
                ),
              ),
              SizedBox(
                width: AppSizes.spaceBtwItems / 2,
              ),
              AppRoundedContainer(
                width: 80,
                height: 80,
                showBorder: true,
                borderColor: AppColors.grey,
                backgroundColor: AppColors.white,
                onTap: () {
                  onTapToAddImages();
                },
                child: Icon(Icons.add),
              )
            ],
          ))
        ],
      ),
    );
  }

  _uploadedImagesOrEmptyList() {
  return  additionalProductImagesURLs.isNotEmpty ? _uploadImages() : _emptyList();
}

  _emptyList() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return AppRoundedContainer(
          width: 80,
          height: 80,
          showBorder: true,
          borderColor: AppColors.grey,
          backgroundColor: AppColors.white,
          child: Stack(
            children: [
              Image.asset(
                AppAssets.defaultProfile,
                width: 80,
                height: 80,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: GestureDetector(
                  onTap: () {
                    // onTapToDeleteImage(index);
                  },
                  child: Icon(
                    Icons.close,
                    color: AppColors.error,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          width: AppSizes.spaceBtwItems / 2,
        );
      },
      itemCount: 6);
  }
  
  _uploadImages() {
    return ListView.separated(itemBuilder :(context, index) {
      final image = additionalProductImagesURLs[index];

      return AppRoundedContainer(
        width: 80,
        height: 80,
        showBorder: true,
        borderColor: AppColors.grey,
        backgroundColor: AppColors.white,
        child: Stack(
          children: [
            Image.network(
              image,
              width: 80,
              height: 80,
            ),
            Positioned(
              right: 0,
              top: 0,
              child: GestureDetector(
                onTap: () {
                  onTapToDeleteImage(index);
                },
                child: Icon(
                  Icons.close,
                  color: AppColors.error,
                  size: 20,
                ),
              ),
            )
          ],
        ),
      );


    }, separatorBuilder :(context, index) {
      return SizedBox(width: AppSizes.spaceBtwItems / 2);
    }, itemCount: additionalProductImagesURLs.length);
  }
}


