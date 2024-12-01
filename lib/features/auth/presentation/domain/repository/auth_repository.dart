import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> userAuthStatus();
}