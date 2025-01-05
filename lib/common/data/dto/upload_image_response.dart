import 'package:firebase_storage/firebase_storage.dart';

final class UploadImageResponse {
  final String imageUrl;
  final FullMetadata metadata;

  UploadImageResponse({required this.imageUrl, required this.metadata});
}
