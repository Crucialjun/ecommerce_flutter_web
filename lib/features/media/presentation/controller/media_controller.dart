import 'dart:typed_data';

import 'package:ecommerce_flutter_web/common/data/models/image_model.dart';
import 'package:ecommerce_flutter_web/common/dialogs/default_dialog.dart';
import 'package:ecommerce_flutter_web/constants/app_assets.dart';
import 'package:ecommerce_flutter_web/constants/app_colors.dart';
import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/features/media/domain/params/upload_media_to_cloud_params.dart';
import 'package:ecommerce_flutter_web/features/media/domain/usecases/upoad_media_usecase.dart';
import 'package:ecommerce_flutter_web/services/dialog_and_sheet_service/dialog_and_sheet_service.dart';
import 'package:ecommerce_flutter_web/utils/dialogs/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:universal_html/html.dart' as html;

class MediaController extends GetxController {
  static MediaController get instance => Get.find();

  late DropzoneViewController dropzoneViewController;

  final RxString selectedFolder = "folders".obs;

  final RxBool showImageUploaderSection = false.obs;

  final RxList<ImageModel> selectedImagesToUpload = <ImageModel>[].obs;
  final RxList<ImageModel> allImages = <ImageModel>[].obs;
  final RxList<ImageModel> allProductImages = <ImageModel>[].obs;
  final RxList<ImageModel> allBannerImages = <ImageModel>[].obs;
  final RxList<ImageModel> allBrandImages = <ImageModel>[].obs;
  final RxList<ImageModel> allCategoryImages = <ImageModel>[].obs;
  final RxList<ImageModel> allUserImages = <ImageModel>[].obs;

  final dialogService = locator<DialogAndSheetService>();

  Future<void> selectLocalImages() async {
    final files = await dropzoneViewController.pickFiles(multiple: true, mime: [
      'image/jpeg',
      'image/png',
    ]);

    if (files.isNotEmpty) {
      for (final file in files) {
        Logger().i('Dropped file: ${file.name}');
        final bytes = await dropzoneViewController.getFileData(file);
        final image = ImageModel(
          fileName: file.name,
          url: "",
          file: html.File(bytes, file.name),
          folder: "",
          localImageToDisplay: Uint8List.fromList(bytes),
        );
        selectedImagesToUpload.add(image);
      }
    }
  }

  void uploadImagesConfirm() {
    Logger().i('Upload images confirm');
    if (selectedFolder.value == "folders") {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        width: 500,
        elevation: 0,
        duration: Duration(seconds: 3),
        content: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(Get.context!).brightness == Brightness.dark
                  ? AppColors.darkGrey.withAlpha(900)
                  : AppColors.grey.withAlpha(900)),
          child: Text(
            "Please select a folder to upload images",
            style: Theme.of(Get.context!).textTheme.labelLarge,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
      ));
      return;
    } else {
      dialogService.showAppDialog(DefaultDialog(
        title: "Upload Images",
        content:
            "Are you sure you want to upload all the images in ${selectedFolder.value.toUpperCase()} folder?",
        onConfirm: () async {
          await uploadImages();
        },
      ));
    }
  }

  Future<void> uploadImages() async {
    Get.back();
    dialogService.showAppDialog(LoadingDialog(
      message: 'Sit tight your images are uploading...',
      animationAsset: AppAssets.uploadingDocumentsAnim,
    ));

    RxList<ImageModel> targetList;

    switch (selectedFolder.value) {
      case "products":
        targetList = allProductImages;
        break;
      case "banners":
        targetList = allBannerImages;
        break;
      case "brands":
        targetList = allBrandImages;
        break;
      case "categories":
        targetList = allCategoryImages;
        break;
      case "users":
        targetList = allUserImages;
        break;
      default:
        targetList = allImages;
    }

    for (int i = selectedImagesToUpload.length - 1; i >= 0; i--) {
      final selectedImage = selectedImagesToUpload[i];
      final image = selectedImage.file;

      if (image != null) {
        final res = await UploadMediaUseCase().call(UploadMediaToCloudParams(
            file: image,
            path: getSelectedPath(),
            imageName: selectedImage.fileName,
            category: selectedFolder.value));

        res.fold((l) {
          Logger().e('Error uploading image: ${selectedImage.fileName}');

          ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
            width: 500,
            elevation: 0,
            duration: Duration(seconds: 3),
            content: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Theme.of(Get.context!).brightness == Brightness.dark
                      ? AppColors.darkGrey.withAlpha(900)
                      : AppColors.grey.withAlpha(900)),
              child: Text(
                "Error uploading images",
                style: Theme.of(Get.context!).textTheme.labelLarge,
              ),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
          ));
          Get.back();
        }, (r) {
          Logger().i('Image uploaded: ${selectedImage.fileName}');
          targetList.add(r);
          selectedImagesToUpload.removeAt(i);
          Get.back();
        });
      }
    }
  }

  String getSelectedPath() {
    switch (selectedFolder.value) {
      case "products":
        return "/Products";
      case "banners":
        return "/Banners";
      case "brands":
        return "/Brands";
      case "categories":
        return "/Categories";
      case "users":
        return "/Users";
      default:
        return "/Others";
    }
  }
}
