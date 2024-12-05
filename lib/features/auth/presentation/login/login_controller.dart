import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/services/dialog_and_sheet_service/dialog_and_sheet_service.dart';
import 'package:ecommerce_flutter_web/services/network_service/i_network_service.dart';
import 'package:ecommerce_flutter_web/services/network_service/network_service.dart';
import 'package:ecommerce_flutter_web/utils/dialogs/loading_dialog.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();

  final _dialogService = locator<DialogAndSheetService>();
  final _networkService = INetworkService();

  Future signInUser({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    final isConnected = await _networkService.isConnected();
    _dialogService.showAppDialog(
        const LoadingDialog(message: "Registering Admin Account..."));
  }
}
