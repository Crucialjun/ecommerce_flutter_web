import 'dart:typed_data';

import 'package:ecommerce_flutter_web/common/data/models/image_model.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:universal_html/html.dart' as html;

class MediaController extends GetxController {
  static MediaController get instance => Get.find();

  late DropzoneViewController dropzoneViewController;

  final RxString selectedFolder = "folders".obs;

  final RxBool showImageUploaderSection = false.obs;

  final RxList<ImageModel> images = <ImageModel>[].obs;

  Future<void> selectLocalImages() async {
    final files = await dropzoneViewController.pickFiles(multiple: true, mime: [
      'image/jpeg',
      'image/png',
    ]);

    if (files.isNotEmpty) {
      for (final file in files) {
        if (file is html.File) {
          Logger().i('Dropped file: ${file.name}');
          final bytes = await dropzoneViewController.getFileData(file);
          final image = ImageModel(
            fileName: file.name,
            url: "",
            file: file as html.File,
            folder: "",
            localImageToDisplay: Uint8List.fromList(bytes),
          );
          images.add(image);
        }
      }
    }
  }
}
