

import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRemoteDataSource {
  Future<Either<Failure, User>> userAuthStatus();
  Future<Either<Failure, void>> setAuthPersistence({required Persistence persistence});

}
