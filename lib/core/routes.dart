import 'package:ecommerce_flutter_web/features/auth/presentation/forget_passoword/forget_password_screen.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/login/login_screen.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/reset_password/reset_password_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Routes {
  static final List<GetPage> routes = [
    GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
    GetPage(
        name: ForgetPasswordScreen.routeName,
        page: () => const ForgetPasswordScreen()),
    GetPage(
        name: ResetPasswordScreen.routeName,
        page: () => const ResetPasswordScreen()),
  ];
}
