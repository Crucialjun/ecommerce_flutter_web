import 'package:ecommerce_flutter_web/services/dialog_and_sheet_service/dialog_and_sheet_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IDialogAndSheetService extends DialogAndSheetService {
  @override
  Future<T?> showAppBottomSheet<T>(Widget child) async {
    return showModalBottomSheet(
      context: Get.overlayContext!,
      enableDrag: true,
      isScrollControlled: true,
      elevation: 0,
      isDismissible: true,
      useRootNavigator: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) => child,
    );
  }

  @override
  Future<T?> showAppDialog<T>(Widget child) async {
    return showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      //useRootNavigator: true,

      useSafeArea: true,
      builder: (context) => PopScope(canPop: false, child: child),
    );
  }
}
