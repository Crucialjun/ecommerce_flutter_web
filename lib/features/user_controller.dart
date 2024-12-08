import 'package:ecommerce_flutter_web/common/data/models/user_model.dart';
import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/services/firebase_service/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();
  RxBool isLoading = false.obs;

  Rx<UserModel> appuser = UserModel.empty().obs;

  void setUser(UserModel userModel) {
    appuser.value = userModel;
  }

  final _firebaseService = locator<FirebaseService>();

  @override
  void onInit() {
    Logger().i("User Controller Init");
    getUser();
    super.onInit();
    Logger().i("User Controller Init Done");
  }

  @override
  void onReady() {
    Logger().i("User Controller Ready");
    super.onReady();
    Logger().i("User Controller Ready Done");
  }

  Future getUser() async {
    Logger().i("Getting user");
    isLoading.value = true;
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      Logger().e("User not authenticated");
      isLoading.value = false;
    } else {
      final res = await _firebaseService.getUserFromDb(
          uid: user.uid, collectionName: "Users");
      res.fold((l) {
        Logger().e(l.message);
        isLoading.value = false;
      }, (r) {
        Logger().i("User: ${r.data()}");
        appuser.value = UserModel.fromDocumentSnapshot(r);
        appuser.refresh();
        isLoading.value = false;
      });
    }
  }
}
