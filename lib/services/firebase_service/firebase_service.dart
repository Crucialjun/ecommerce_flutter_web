import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/common/data/dto/upload_image_response.dart';
import 'package:ecommerce_flutter_web/common/data/models/image_model.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:universal_html/html.dart';

abstract class FirebaseService {
  Future<Either<Failure, User>> userAuthStatus();
  Future<Either<Failure, User?>> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<Either<Failure, User?>> signUpWithEmailAndPassword(
      {required String email, required String password});
  Future<Either<Failure, void>> addUsertoDb({
    required Map<String, dynamic> user,
    required String dbName,
  });
  Future<Either<Failure, DocumentSnapshot<Map<String, dynamic>>>> getUserFromDb(
      {required String collectionName, required String uid});
  Future<Either<Failure, UploadImageResponse>> uploadFile(
      {required String path,
      required Uint8List file,
      required String imageName});
  Future<Either<Failure, void>> updateUserOnDb({
    required Map<String, dynamic> user,
    required String dbName,
  });
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, void>> addProductToDb({
    required Map<String, dynamic> product,
    required String dbName,
  });
  Future<Either<Failure, void>> setAuthPersistence({
    required Persistence persistence,
  });
  Future<Either<Failure, List<ImageModel>>> fetchImagesFromDb({
    required String category,
    required int loadCount,
  });
  Future<Either<Failure, List<ImageModel>>> loadMoreImagesFromDatabase({
    required String category,
    required int loadCount,
    required DateTime lastFetchedDate,
  });
  Future<Either<Failure, void>> deleteImageFromDb(
      {required String path, required String imageName, required String id});
}
