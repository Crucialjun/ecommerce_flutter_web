import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/core/usecase.dart';
import 'package:ecommerce_flutter_web/features/auth/domain/params/login_params.dart';
import 'package:ecommerce_flutter_web/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInUsecase with UseCases<User?, LoginParams> {
  final _repository = locator<AuthRepository>();
  
  @override
  Future<Either<Failure, User?>> call(LoginParams params) {
    return _repository.signInWithEmailAndPassword(loginParams: params);
  }

 

  

  
}