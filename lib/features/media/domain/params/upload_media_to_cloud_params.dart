import 'package:universal_html/html.dart';

class UploadMediaToCloudParams {
  final File file;
  final String path;
  final String imageName;
  final String category;

  UploadMediaToCloudParams(
      {required this.file, required this.path, required this.imageName, required this.category});
}
