import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/core/usecase.dart';
import 'package:ecommerce_flutter_web/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAuthStatusUsecase with UseCases<User, NoParams> {
  final _authRepository = locator<AuthRepository>();
  @override
  Future<Either<Failure, User>> call(NoParams params) {
    return _authRepository.userAuthStatus();
  }
}
