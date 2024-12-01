import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/common/data/models/user_model.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:ecommerce_flutter_web/features/auth/domain/params/login_params.dart';
import 'package:ecommerce_flutter_web/services/firebase_service/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final _firebaseService = locator<FirebaseService>();
  @override
  Future<Either<Failure, User>> userAuthStatus() {
    return _firebaseService.userAuthStatus();
  }

  @override
  Future<Either<Failure, void>> setAuthPersistence(
      {required Persistence persistence}) {
    return _firebaseService.setAuthPersistence(persistence: persistence);
  }

  @override
  Future<Either<Failure, User?>> signInWithEmailAndPassword(
      {required LoginParams loginParams}) {
    return _firebaseService.signInWithEmailAndPassword(
        email: loginParams.email, password: loginParams.password);
  }
  
  @override
  Future<Either<Failure, User?>> signUpWithEmailAndPassword({required LoginParams loginParams}) {
    return _firebaseService.signUpWithEmailAndPassword(email: loginParams.email, password: loginParams.password);
  }

  @override
  Future<Either<Failure, void>> addUserToDb({required UserModel userModel}) {
    return _firebaseService.addUsertoDb(user: userModel.toJson(),dbName: "Users");
  }
}
