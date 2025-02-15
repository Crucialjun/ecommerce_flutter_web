import 'package:ecommerce_flutter_web/common/sidebar/sidebar_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RouteObservers extends GetObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    final sidebarController = Get.put(SidebarController());

    if (previousRoute != null) {
      for (var entry in sidebarController.menuItems) {
        if (entry == previousRoute.settings.name) {
          sidebarController.setActiveItem(entry);
          break;
        }
      }
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    /// This is the route that was pushed.
    /// This is the route that was pushed.
    super.didPush(route, previousRoute);
  }
}
