import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:ecommerce_flutter_web/services/firebase_service/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final _firebaseService = locator<FirebaseService>();
  @override
  Future<Either<Failure, User>> userAuthStatus() {
    // TODO: implement userAuthStatus
    throw UnimplementedError();
  }
}