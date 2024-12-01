import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/common/data/models/user_model.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:ecommerce_flutter_web/features/auth/domain/params/login_params.dart';
import 'package:ecommerce_flutter_web/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _remoteDataSource = locator<AuthRemoteDataSource>();
  @override
  Future<Either<Failure, User>> userAuthStatus() {
    return _remoteDataSource.userAuthStatus();
  }

  @override
  Future<Either<Failure, void>> setAuthPersistence(
      {required Persistence persistence}) {
    return _remoteDataSource.setAuthPersistence(persistence: persistence);
  }

  @override
  Future<Either<Failure, void>> addUserToDb({required UserModel userModel}) {
    return _remoteDataSource.addUserToDb(userModel: userModel);
  }

  @override
  Future<Either<Failure, User?>> signInWithEmailAndPassword(
      {required LoginParams loginParams}) {
    return _remoteDataSource.signInWithEmailAndPassword(
        loginParams: loginParams);
  }

  @override
  Future<Either<Failure, User?>> signUpWithEmailAndPassword(
      {required LoginParams loginParams}) {
    return _remoteDataSource.signUpWithEmailAndPassword(
        loginParams: loginParams);
  }
}
