import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/common/data/models/user_model.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/core/usecase.dart';
import 'package:ecommerce_flutter_web/features/auth/domain/repository/auth_repository.dart';

class GetUserFromDbUsecase with UseCases<UserModel, String> {
  final _repository = locator<AuthRepository>();
  @override
  Future<Either<Failure, UserModel>> call(String params) {
    return _repository.getUserFromDb(uid: params);
  }
}
