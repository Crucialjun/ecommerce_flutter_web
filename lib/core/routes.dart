import 'package:ecommerce_flutter_web/features/auth/presentation/login/login_screen.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Routes {
  static final List<GetPage> routes = [
    GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
  ];
}
