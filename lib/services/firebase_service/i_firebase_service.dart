import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/common/data/dto/upload_image_response.dart';
import 'package:ecommerce_flutter_web/common/data/models/image_model.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/services/firebase_service/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:universal_html/html.dart' as html;

class IFirebaseService implements FirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  final _logger = Logger();

  @override
  Future<Either<Failure, User>> userAuthStatus() async {
    final user = _firebaseAuth.currentUser;

    if (user != null) {
      return Right(user);
    } else {
      return const Left(Failure("User not authenticated"));
    }
  }

  @override
  Future<Either<Failure, User?>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.setPersistence(Persistence.LOCAL);

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(credential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _logger.e('No user found for that email.');
        return const Left(Failure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        _logger.e('Wrong password provided for that user.');
        return const Left(Failure('Wrong password provided for that user.'));
      } else if (e.code == 'invalid-email') {
        _logger.e('Invalid email provided.');
        return const Left(Failure('Invalid email provided.'));
      } else if (e.code == 'user-disabled') {
        _logger.e('User disabled.');
        return const Left(Failure('User disabled.'));
      } else if (e.code == 'too-many-requests') {
        _logger.e('Too many requests.');
        return const Left(Failure('Too many requests.'));
      } else if (e.code == 'operation-not-allowed') {
        _logger.e('Operation not allowed.');
        return const Left(Failure('Operation not allowed.'));
      } else if (e.code == 'invalid-credential') {
        _logger.e('Invalid Credential.');
        return const Left(Failure(
            'Invalid Credentials, please try again with a valid email and password.'));
      } else {
        _logger.e(e.toString());
        return Left(Failure(e.toString()));
      }
    } catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User?>> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.setPersistence(Persistence.LOCAL);

      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(credential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _logger.e('The password provided is too weak.');
        return const Left(Failure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        _logger.e('The account already exists for that email.');
        return const Left(
            Failure('The account already exists for that email.'));
      } else {
        _logger.e(e.toString());
        return Left(Failure(e.toString()));
      }
    } catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addUsertoDb(
      {required Map<String, dynamic> user, required String dbName}) async {
    try {
      final res = await _db
          .collection(dbName)
          .doc(user["id"])
          .set(user)
          .onError((error, stackTrace) => throw Failure(
              "Error adding user to database: ${error.toString()}"));

      return Right(res);
    } on Failure catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DocumentSnapshot<Map<String, dynamic>>>> getUserFromDb(
      {required String collectionName, required String uid}) async {
    try {
      Logger().i(
          "Getting user from database, uid: $uid, collection: $collectionName");

      var res = await _db.collection(collectionName).doc(uid).get().onError(
          (error, stackTrace) => throw Failure(
              "Error getting user from database: ${error.toString()}"));

      return Right(res);
    } on Failure catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserOnDb(
      {required Map<String, dynamic> user, required String dbName}) async {
    try {
      final res = await _db
          .collection(dbName)
          .doc(user["uid"])
          .update(user)
          .onError((error, stackTrace) => throw Failure(
              "Error adding user to database: ${error.toString()}"));

      return Right(res);
    } on Failure catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addProductToDb(
      {required Map<String, dynamic> product, required String dbName}) async {
    try {
      final res = await _db.collection(dbName).add(product).onError(
          (error, stackTrace) => throw Failure(
              "Error adding product to database: ${error.toString()}"));

      return Right(res);
    } on Failure catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> setAuthPersistence(
      {required Persistence persistence}) async {
    try {
      await _firebaseAuth.setPersistence(persistence);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UploadImageResponse>> uploadFile(
      {required String path,
      required Uint8List file,
      required String imageName}) async {
    try {
      Logger().i("Uploading file to path: $path");

      Logger().i("Uploading file with name: $imageName");

      final ref = storage.ref().child(path).child(imageName);

      //convert the file to uint8list

      await ref.putData(file);

      final url = await ref.getDownloadURL();

      final FullMetadata metadata = await ref.getMetadata();

      return Right(UploadImageResponse(imageUrl: url, metadata: metadata));
    } on FirebaseException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } on SocketException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } on HttpException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } on FormatException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } on PlatformException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ImageModel>>> fetchImagesFromDb(
      {required String category, required int loadCount}) async {
    try {
      final querySnapshot = await _db
          .collection("Images")
          .where("mediaCategory", isEqualTo: category)
          .orderBy("createdAt", descending: true)
          .limit(loadCount)
          .get();

      return Right(querySnapshot.docs
          .map((doc) => ImageModel.fromSnapshot(doc))
          .toList());
    } on FirebaseException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } on SocketException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } on HttpException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } on FormatException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } on PlatformException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ImageModel>>> loadMoreImagesFromDatabase(
      {required String category,
      required int loadCount,
      required DateTime lastFetchedDate}) async {
    try {
      final querySnapshot = await _db
          .collection("Images")
          .where("mediaCategory", isEqualTo: category)
          .orderBy("createdAt", descending: true)
          .startAfter([lastFetchedDate])
          .limit(loadCount)
          .get();

      return Right(querySnapshot.docs
          .map((doc) => ImageModel.fromSnapshot(doc))
          .toList());
    } on FirebaseException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } on SocketException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } on HttpException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } on FormatException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } on PlatformException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteImageFromDb(
      {required String path,
      required String imageName,
      required String id}) async {
    try {
      Logger().i("Deleting image from path: $path");

      Logger().i("Deleting image with name: $imageName");

      await storage.ref().child(path).delete();

      await _db.collection("Images").doc(id).delete();

      return Right(null);
    } on FirebaseException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } on SocketException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } on HttpException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } on FormatException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } on PlatformException catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    } catch (e) {
      _logger.e(e.toString());
      return Left(Failure(e.toString()));
    }
  }
}
