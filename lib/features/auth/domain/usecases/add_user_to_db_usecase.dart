import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/common/data/models/user_model.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/core/usecase.dart';
import 'package:ecommerce_flutter_web/features/auth/domain/repository/auth_repository.dart';

class AddUserToDbUsecase with UseCases<void,UserModel> {
  final _repository = locator<AuthRepository>();
  @override
  Future<Either<Failure, void>> call(UserModel params) {
    return _repository.addUserToDb(userModel: params);
  }
}