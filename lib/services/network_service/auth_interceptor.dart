import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/services/dialog_and_sheet_service/dialog_and_sheet_service.dart';
import 'package:logger/logger.dart';

class AuthInterceptor extends Interceptor {
  final dialogAndSheetService = locator<DialogAndSheetService>();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Logger().e(
      '---ENDPOINT: ${err.requestOptions.uri}\n'
      '---STATUSCODE: ${err.error}\n'
      '---MESSAGE: ${err.response?.data ?? err.message}',
    );
    if (err.response?.data['message'] == 'SESSION_OUT') {}

    handler.reject(err);
  }

  @override
  FutureOr<dynamic> onResponse(Response response, handler) async {
    Logger().i("response.data is ${response.data}");

    if (response.data == "") {
      return super.onResponse(response, handler);
    }

    try {
      var responseData = json.decode(json.encode(response.data));
      if (responseData["message"] == "Token Has Expired or Invalid") {}
    } catch (e) {
      Logger().e("Error in AuthInterceptor: $e");
    }

    return super.onResponse(response, handler);
  }
}
