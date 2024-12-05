import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/services/firebase_service/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';

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
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
          .doc(user["uid"])
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
  Future<Either<Failure, DocumentSnapshot<Map<String,dynamic>>>> getUserFromDb(
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
  Future<Either<Failure, String>> uploadFile(
      {required String path, required File file}) async {
    try {
      Logger().i("Uploading file to path: $path");

      final ref = storage.ref().child(path);

      final uploadTask = await ref
          .putFile(file)
          .onError((error, stackTrace) {
            throw Failure("Error uploading file: ${error.toString()}");
          })
          .whenComplete(() => Logger().i("File upload task complete"))
          .timeout(const Duration(seconds: 60),
              onTimeout: () =>
                  throw const Failure("File upload task timed out"));

      final url = await uploadTask.ref.getDownloadURL();

      return Right(url);
    } on FirebaseException catch (e) {
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
      final res = await _db
          .collection(dbName)
          .doc(product["id"])
          .set(product)
          .onError((error, stackTrace) => throw Failure(
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
    // TODO: implement signOut
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
}
