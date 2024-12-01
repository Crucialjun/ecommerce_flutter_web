import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/core/usecase.dart';
import 'package:ecommerce_flutter_web/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SetAuthPersistenceUsecase with UseCases<void,Persistence> {
  final _authRepository = locator<AuthRepository>();
  @override
  Future<Either<Failure, void>> call(Persistence params) {
    return _authRepository.setAuthPersistence(persistence: params);
  }
}