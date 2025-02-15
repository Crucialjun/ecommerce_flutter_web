import 'dart:async';

import 'package:ecommerce_flutter_web/core/usecase.dart';
import 'package:ecommerce_flutter_web/features/auth/domain/usecases/user_auth_status_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final userRes = UserAuthStatusUsecase().call(NoParams());

  bool _isUserLoggedIn = false;

  bool get isUserLoggedIn => _isUserLoggedIn;

  late StreamSubscription<User?> userSubscription;

  @override
  void onInit() {
    userSubscription = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        _isUserLoggedIn = true;
      }
    });
    super.onInit();
  }
}
