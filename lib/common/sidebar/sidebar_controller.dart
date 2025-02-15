import 'package:ecommerce_flutter_web/utils/device/device_utility.dart';
import 'package:get/get.dart';

class SidebarController extends GetxController {
  final activeItem = "/".obs;
  final hoverItem = "".obs;

  void setActiveItem(String route) {
    activeItem.value = route;
  }

  void setHoverItem(String route) {
    if (hoverItem.value != activeItem.value) {
      hoverItem.value = route;
    }
  }

  bool isActive(String route) {
    return activeItem.value == route;
  }

  bool isHover(String route) {
    return hoverItem.value == route;
  }

  void menuOnTap(String route) {
    if (isActive(route)) {
      return;
    } else {
      activeItem.value = route;

      if (AppDeviceUtils.isMobileScreen(Get.context!)) {
        Get.back();
      }
      Get.toNamed(route);
    }
  }

  final List<String> menuItems = [
    "/",
    "/media",
    "/categories",
    "/products",
    "/brands",
  ];
}
