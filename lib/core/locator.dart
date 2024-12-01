import 'package:ecommerce_flutter_web/features/auth/controller/auth_controller.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/data/repository/auth_repository_impl.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/domain/repository/auth_repository.dart';
import 'package:ecommerce_flutter_web/services/firebase_service/firebase_service.dart';
import 'package:ecommerce_flutter_web/services/firebase_service/i_firebase_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future setupLocator() async {
  //services
  locator.registerLazySingleton<FirebaseService>(() => IFirebaseService());

  //remote data sources
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());

  //repositories
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  //Controllers
  locator.registerLazySingleton(() => AuthController());
}
