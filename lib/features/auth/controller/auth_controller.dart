import 'package:dartz/dartz.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/core/usecase.dart';
import 'package:ecommerce_flutter_web/features/auth/domain/usecases/set_auth_persistence_usecase.dart';
import 'package:ecommerce_flutter_web/features/auth/domain/usecases/user_auth_status_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final userRes = UserAuthStatusUsecase().call(NoParams());

  bool _isUserLoggedIn = false;

  bool get isUserLoggedIn => _isUserLoggedIn;

  @override
  void onReady() {
    userStatus();
    setPersistence();

    super.onReady();
  }

  Future<Either<Failure, void>> setPersistence() async =>
      await SetAuthPersistenceUsecase().call(Persistence.LOCAL);

  Future<void> userStatus() async {
    await userRes.then((value) {
      value.fold((l) {
        _isUserLoggedIn = false;
      }, (r) {
        _isUserLoggedIn = true;
      });
    });
  }
}
