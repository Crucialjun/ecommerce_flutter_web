import 'dart:typed_data';

import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart';

class ImageModel {
  String id;
  final String url;
  final String folder;
  final int? sizeBytes;
  String mediaCategory;
  final String fileName;
  final String? fullPath;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? contentType;

  //not mapped
  final File? file;
  RxBool isSelected = false.obs;
  final Uint8List? localImageToDisplay;

  ImageModel(
      {this.id = "",
      required this.url,
      required this.folder,
       this.sizeBytes,
      required this.fileName,
       this.fullPath,
       this.createdAt,
       this.updatedAt,
       this.contentType,
       this.file,
      this.mediaCategory = "",
       this.localImageToDisplay});


      //to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'folder': folder,
      'sizeBytes': sizeBytes,
      'mediaCategory': mediaCategory,
      'fileName': fileName,
      'fullPath': fullPath,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'contentType': contentType,
    };
  }

  factory ImageModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return ImageModel(
      id: snapshot.id,
      url: data!['url'],
      folder: data['folder'],
      sizeBytes: data['sizeBytes'],
      mediaCategory: data['mediaCategory'],
      fileName: data['fileName'],
      fullPath: data['fullPath'],
      createdAt: data['createdAt'],
      updatedAt: data['updatedAt'],
      contentType: data['contentType'],
    );
  }

  //from firebaseMetadata
  factory ImageModel.fromFirebaseMetadata(FullMetadata metadata, String folder,String filename,String downloadUrl) {
    return ImageModel(
      url: downloadUrl,
      folder: folder,
      sizeBytes: metadata.size,
      fileName: metadata.name,
      fullPath: metadata.fullPath,
      createdAt: metadata.timeCreated,
      updatedAt: metadata.updated,
      contentType: metadata.contentType,
    );
  }
}
