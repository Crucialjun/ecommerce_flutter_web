import 'package:ecommerce_flutter_web/common/data/models/image_model.dart';
import 'package:ecommerce_flutter_web/features/media/presentation/controller/media_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  static ProductsController get instance => Get.find();

  Rx<String?> selectedThumbnailIImageUrl = Rx<String?>(null);

  final RxList<String> additionalProductImagesUrls = <String>[].obs;

  void selectThumbnailImage() async {
    final controller = Get.put(MediaController());
    List<ImageModel> selectedImages = await controller.selectImagesFromMedia();

    if (selectedImages.isNotEmpty) {
      selectedThumbnailIImageUrl.value = selectedImages.first.url;
    }
  }

  void selectMultipleProductImages() async {
    final controller = Get.put(MediaController());
    List<ImageModel> selectedImages = await controller.selectImagesFromMedia(
        multipleSelection: true, selectedUrls: additionalProductImagesUrls);

    if (selectedImages.isNotEmpty) {
      additionalProductImagesUrls.assignAll(selectedImages.map((e) => e.url));
    }
  }

  Future<void> removeImage(int index) async {
    additionalProductImagesUrls.removeAt(index);
  }
}
