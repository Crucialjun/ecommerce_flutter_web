import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';

class MediaController extends GetxController {
  static MediaController get instance => Get.find();

  late DropzoneViewController dropzoneViewController;

  final RxString selectedFolder = "folders".obs;

  final RxBool showImageUploaderSection = false.obs;

}
