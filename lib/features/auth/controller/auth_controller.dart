import 'package:ecommerce_flutter_web/core/usecase.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/domain/usecases/user_auth_status_usecase.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/login/login_screen.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/dashboard_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final userRes = UserAuthStatusUsecase().call(NoParams());

  @override
  void onReady() {
    userStatus();
    super.onReady();
  }

  Future<void> userStatus() async {
    await userRes.then((value) {
      value.fold((l) {
        Get.offAllNamed(LoginScreen.routeName);
      }, (r) {
        Get.offAllNamed(DashboardScreen.routeName);
      });
    });
  }
}
