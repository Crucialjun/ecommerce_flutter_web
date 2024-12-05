import 'dart:io';


import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';


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
  Future<Either<Failure, DocumentSnapshot<Map<String,dynamic>>>> getUserFromDb(
      {required String collectionName, required String uid});
  Future<Either<Failure, String>> uploadFile(
      {required String path, required File file});
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
  
}
