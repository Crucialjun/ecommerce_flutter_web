import 'package:ecommerce_flutter_web/common/data/enums/app_role_enum.dart';
import 'package:ecommerce_flutter_web/common/data/models/user_model.dart';
import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/features/auth/domain/params/login_params.dart';
import 'package:ecommerce_flutter_web/features/auth/domain/usecases/add_user_to_db_usecase.dart';
import 'package:ecommerce_flutter_web/features/auth/domain/usecases/get_user_from_db_usecase.dart';
import 'package:ecommerce_flutter_web/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:ecommerce_flutter_web/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:ecommerce_flutter_web/features/dashboard/presentation/dashboard_screen.dart';
import 'package:ecommerce_flutter_web/features/user_controller.dart';
import 'package:ecommerce_flutter_web/services/dialog_and_sheet_service/dialog_and_sheet_service.dart';
import 'package:ecommerce_flutter_web/services/network_service/i_network_service.dart';

import 'package:ecommerce_flutter_web/utils/dialogs/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

class LoginController extends GetxController {
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();
  final _dialogService = locator<DialogAndSheetService>();
  final _networkService = INetworkService();
  //final _authController = locator<AuthController>();
  final _userController = locator<UserController>();

  Future signUpUser({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    final isConnected = await _networkService.isConnected();
    _dialogService.showAppDialog(
        const LoadingDialog(message: "Registering Admin Account..."));

    if (!isConnected) {
      Navigator.of(Get.overlayContext!).pop();
    }

    var res = await SignUpUsecase()
        .call(LoginParams(email: email, password: password));

    await res.fold((l) {
      Logger().e(l.message);
      Navigator.of(Get.overlayContext!).pop();
      Get.snackbar("Oh Snap", l.message);
    }, (r) async {
      var res = await AddUserToDbUsecase().call(UserModel(
          id: r?.uid ?? "",
          firstName: "Cwt",
          lastName: "Admin",
          username: "CwtAdmin",
          email: email,
          phoneNumber: "phoneNumber",
          profilePicture: "profilePicture",
          role: AppRoleEnum.admin,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now()));

      await res.fold((l) async {
        Logger().e(l.message);
        Navigator.of(Get.overlayContext!).pop();
        Get.snackbar("Oh Snap", l.message);
      }, (r) {
        Logger().i("User added to db");
        Navigator.of(Get.overlayContext!).pop();
        Get.offAll(() => const DashboardScreen());
      });
    });
  }

  Future signInUser({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    final isConnected = await _networkService.isConnected();
    _dialogService.showAppDialog(
        const LoadingDialog(message: "Logging in to your  Admin Account..."));

    if (!isConnected) {
      Navigator.of(Get.overlayContext!).pop();
    }

    var res = await SignInUsecase()
        .call(LoginParams(email: email, password: password));

    res.fold((l) {
      Logger().e(l.message);
      Navigator.of(Get.overlayContext!).pop();
      Get.snackbar("Oh Snap", l.message);
    }, (r) async {
      final res = await GetUserFromDbUsecase().call(r?.uid ?? "");

      res.fold((l) {
        Logger().e(l.message);
        Navigator.of(Get.overlayContext!).pop();
        Get.snackbar("Oh Snap", l.message);
      }, (r) {
        if (r.role != AppRoleEnum.admin) {
          Navigator.of(Get.overlayContext!).pop();
          Get.snackbar("Oh Snap", "You are not an admin");
          return;
        } else {
          _userController.setUser(r);
          Navigator.of(Get.overlayContext!).pop();
          Get.offAllNamed(DashboardScreen.routeName);
        }
      });
    });
  }
}
