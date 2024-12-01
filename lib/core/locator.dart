
import 'package:ecommerce_flutter_web/features/auth/controller/auth_controller.dart';
import 'package:ecommerce_flutter_web/services/firebase_service/firebase_service.dart';
import 'package:ecommerce_flutter_web/services/firebase_service/i_firebase_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;


Future setupLocator() async {

  //services
  locator.registerLazySingleton<FirebaseService>(() => IFirebaseService());


  //Controllers
  locator.registerLazySingleton(() => AuthController());

}