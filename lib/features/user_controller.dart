import 'package:ecommerce_flutter_web/common/data/models/user_model.dart';
import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/services/firebase_service/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class UserController extends GetxController {
  RxBool isLoading = false.obs;

  Rx<UserModel> appuser = UserModel.empty().obs;

  void setUser(UserModel userModel) {
    appuser.value = userModel;
  }

  final _firebaseService = locator<FirebaseService>();

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  void getUser() async {
    Logger().i("Getting user");
    isLoading.value = true;
    final user = await _firebaseService.userAuthStatus();

    await user.fold((l) {
      isLoading.value = false;
    }, (r) async {
      final res = await _firebaseService.getUserFromDb(
          uid: r.uid, collectionName: "Users");
      res.fold((l) {
        isLoading.value = false;
      }, (r) {
        appuser.value = UserModel.fromDocumentSnapshot(r);
        isLoading.value = false;
      });
    });
  }
}
