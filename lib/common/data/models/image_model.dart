import 'dart:typed_data';

import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

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
  final Uint8List? file;
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

  factory ImageModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.data() == null) {
      return ImageModel(url: "", folder: "", fileName: "");
    }

    final data = snapshot.data();
    return ImageModel(
      id: snapshot.id,
      url: data!['url'],
      folder: data['folder'],
      sizeBytes: data['sizeBytes'],
      mediaCategory: data['mediaCategory'],
      fileName: data['fileName'],
      fullPath: data['fullPath'],
      createdAt: data['createdAt'] == null
          ? DateTime.now()
          : (data['createdAt'] as Timestamp).toDate(),
      updatedAt: data["updatedAt"] == null
          ? DateTime.now()
          : (data['updatedAt'] as Timestamp).toDate(),
      contentType: data['contentType'],
    );
  }

  //from firebaseMetadata
  factory ImageModel.fromFirebaseMetadata(FullMetadata metadata, String folder,
      String filename, String downloadUrl) {
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

  //copy with
  ImageModel copyWith({
    String? id,
    String? url,
    String? folder,
    int? sizeBytes,
    String? mediaCategory,
    String? fileName,
    String? fullPath,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? contentType,
    Uint8List? file,
    Uint8List? localImageToDisplay,
  }) {
    return ImageModel(
      id: id ?? this.id,
      url: url ?? this.url,
      folder: folder ?? this.folder,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      mediaCategory: mediaCategory ?? this.mediaCategory,
      fileName: fileName ?? this.fileName,
      fullPath: fullPath ?? this.fullPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      contentType: contentType ?? this.contentType,
      file: file ?? this.file,
      localImageToDisplay: localImageToDisplay ?? this.localImageToDisplay,
    );
  }
}
