import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/common/data/models/user_model.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/features/auth/domain/params/login_params.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRemoteDataSource {
  Future<Either<Failure, User>> userAuthStatus();
  Future<Either<Failure, void>> setAuthPersistence(
      {required Persistence persistence});
  Future<Either<Failure, User?>> signInWithEmailAndPassword(
      {required LoginParams loginParams});
  Future<Either<Failure, User?>> signUpWithEmailAndPassword(
      {required LoginParams loginParams});
  Future<Either<Failure, void>> addUserToDb({required UserModel userModel});
  Future<Either<Failure, UserModel>> getUserFromDb({required String uid});
}
