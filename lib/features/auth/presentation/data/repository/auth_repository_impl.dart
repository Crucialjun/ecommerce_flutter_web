import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _remoteDataSource = locator<AuthRemoteDataSource>();
  @override
  Future<Either<Failure, User>> userAuthStatus() {
    return _remoteDataSource.userAuthStatus();
  }
  
  @override
  Future<Either<Failure, void>> setAuthPersistence({required Persistence persistence}) {
    return _remoteDataSource.setAuthPersistence(persistence: persistence);
  }
}