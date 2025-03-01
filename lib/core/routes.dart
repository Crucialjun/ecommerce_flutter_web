import 'package:ecommerce_flutter_web/core/route_middlewares.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/forget_passoword/forget_password_screen.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/login/login_screen.dart';
import 'package:ecommerce_flutter_web/features/auth/presentation/reset_password/reset_password_screen.dart';
import 'package:ecommerce_flutter_web/features/banners/presentation/all_banners/all_banners_screen.dart';
import 'package:ecommerce_flutter_web/features/banners/presentation/create_banner/create_banner_screen.dart';
import 'package:ecommerce_flutter_web/features/banners/presentation/edit_banner/edit_banner_screen.dart';
import 'package:ecommerce_flutter_web/features/brands/presentation/all_brands/all_brands_screen.dart';
import 'package:ecommerce_flutter_web/features/brands/presentation/create_brand/create_brand_screen.dart';
import 'package:ecommerce_flutter_web/features/brands/presentation/edit_brand/edit_brand_screen.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/all_categories/categories_screen.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/create_category/create_category_screen.dart';
import 'package:ecommerce_flutter_web/features/categories/presentation/edit_category/edit_category_screen.dart';
import 'package:ecommerce_flutter_web/features/customers/presentation/all_customers/all_customers_screen.dart';
import 'package:ecommerce_flutter_web/features/customers/presentation/customer_details/customer_details_screen.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/dashboard_screen.dart';
import 'package:ecommerce_flutter_web/features/media/presentation/media_screen/media_screen.dart';
import 'package:ecommerce_flutter_web/features/products/presentation/add_product/add_product_screen.dart';
import 'package:ecommerce_flutter_web/features/products/presentation/all_products/products_screen.dart';
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
    GetPage(
        name: CreateBrandScreen.route,
        page: () => const CreateBrandScreen(),
        middlewares: [RouteMiddlewares()]),
    GetPage(
        name: EditBrandScreen.route,
        page: () => const EditBrandScreen(),
        middlewares: [RouteMiddlewares()]),
    GetPage(
        name: AllBannersScreen.route,
        page: () => const AllBannersScreen(),
        middlewares: [RouteMiddlewares()]),
    GetPage(
        name: EditBannerScreen.routeName,
        page: () => const EditBannerScreen(),
        middlewares: [RouteMiddlewares()]),
    GetPage(
        name: CreateBannerScreen.routeName,
        page: () => const CreateBannerScreen(),
        middlewares: [RouteMiddlewares()]),
    GetPage(
        name: ProductsScreen.routeName,
        page: () => const ProductsScreen(),
        middlewares: [RouteMiddlewares()]),
    GetPage(
        name: AddProductScreen.routeName,
        page: () => const AddProductScreen(),
        middlewares: [RouteMiddlewares()]),
    GetPage(
        name: AllCustomersScreen.routeName,
        page: () => const AllCustomersScreen(),
        middlewares: [RouteMiddlewares()]),
        GetPage(
        name: CustomerDetailsScreen.routeName,
        page: () => const CustomerDetailsScreen(),
        middlewares: [RouteMiddlewares()]),

  ];
}
