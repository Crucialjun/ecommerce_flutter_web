
import 'package:ecommerce_flutter_web/features/auth/controller/auth_controller.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;


Future setupLocator() async {
  locator.registerLazySingleton(() => AuthController());

}