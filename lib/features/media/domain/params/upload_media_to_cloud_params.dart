import 'dart:typed_data';

class UploadMediaToCloudParams {
  final Uint8List file;
  final String path;
  final String imageName;
  final String category;

  UploadMediaToCloudParams(
      {required this.file,
      required this.path,
      required this.imageName,
      required this.category});
}
