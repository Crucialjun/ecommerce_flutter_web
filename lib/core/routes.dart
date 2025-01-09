import 'package:ecommerce_flutter_web/core/route_middlewares.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/forget_passoword/forget_password_screen.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/login/login_screen.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/reset_password/reset_password_screen.dart';
import 'package:ecommerce_flutter_web/features/brands/presentation/all_brands/all_brands_screen.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/all_categories/categories_screen.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/create_category/create_category_screen.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/edit_category/edit_category_screen.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/dashboard_screen.dart';
import 'package:ecommerce_flutter_web/features/media/presentation/media_screen/media_screen.dart';
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
    GetPage(
        name: DashboardScreen.routeName,
        page: () => const DashboardScreen(),
        middlewares: [RouteMiddlewares()]),
    GetPage(
        name: MediaScreen.routeName,
        page: () => const MediaScreen(),
        middlewares: [RouteMiddlewares()]),
    GetPage(
        name: CategoriesScreen.route,
        page: () => const CategoriesScreen(),
        middlewares: [RouteMiddlewares()]),
    GetPage(
        name: CreateCategoryScreen.route,
        page: () => const CreateCategoryScreen(),
        middlewares: [RouteMiddlewares()]),
    GetPage(
        name: EditCategoryScreen.route,
        page: () => const EditCategoryScreen(),
        middlewares: [RouteMiddlewares()]),
    GetPage(
        name: AllBrandsScreen.route,
        page: () => const AllBrandsScreen(),
        middlewares: [RouteMiddlewares()]),
  ];
}
