import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_flutter_web/core/api_response.dart';
import 'package:ecommerce_flutter_web/core/failure.dart';
import 'package:ecommerce_flutter_web/services/network_service/auth_interceptor.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' as getx;

import 'package:logger/logger.dart';

import 'network_service.dart';
import 'network_logger.dart';

class INetworkService extends NetworkService {
  Dio _dio = Dio();
  final _logger = Logger();

  final _headers = {'Accept': 'application/json'};

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final getx.RxList<ConnectivityResult> _connectionStatus =
      <ConnectivityResult>[].obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  INetworkService() {
    _dio = Dio();
    _dio.options.validateStatus = (status) {
      return true;
    };
    _dio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.receiveTimeout = const Duration(seconds: 60);
    _dio.options.sendTimeout = const Duration(seconds: 60);
    _dio.interceptors.addAll([AuthInterceptor(), NetworkLoggerInterceptor()]);
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> delete(String url,
      {dynamic body, Map<String, String>? headers}) async {
    try {
      if (headers != null) {
        _headers.addAll(headers);
      }
      final res = await _dio.delete(
        url,
        data: body,
        options: Options(headers: _headers),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return ApiResponse(data: res.data);
      }
      throw Failure(res.statusMessage!);
    } on DioException catch (e) {
      throw convertException(e);
    } catch (e) {
      _logger.e(e.toString());
      throw Failure(e.toString());
    }
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> get(String url,
      {Map<String, String>? headers}) async {
    _logger.i("received  Get url is $url");
    try {
      if (headers != null) {
        _headers.addAll(headers);
      }
      final res = await _dio.get(
        url,
        options: Options(
          headers: _headers,
          method: 'GET',
        ),
      );
      Logger().i("Get Response: ${res.data.toString()}");
      if (res.statusCode == 200 || res.statusCode == 201) {
        if (res.data is String) {
          return ApiResponse(
            data: jsonDecode(
                  res.data,
                )["data"] ??
                res.data,
            message: jsonDecode(
                  res.data,
                )["message"] ??
                res.data["message"],
            status: jsonDecode(
                  res.data,
                )["status"] ??
                res.data["status"],
          );
        } else {
          return ApiResponse(
              data: res.data['data'] ?? res.data,
              message: res.data['message'],
              status: res.data['status']);
        }
      } else {
        throw Failure(res.statusMessage!);
      }
    } on DioException catch (e) {
      throw convertException(e);
    } catch (e) {
      _logger.e(e.toString());
      throw Failure(e.toString());
    }
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> put(String url,
      {dynamic body, Map<String, String>? headers}) async {
    _logger.i("received url is $url");
    try {
      if (headers != null) {
        _headers.addAll(headers);
      }

      Logger().i("Set put data: $body");
      final res = await _dio.put(
        url,
        data: body,
        options: Options(headers: _headers),
      );

      Logger().i("Put Response: ${res.data.toString()}");

      if (res.statusCode == 200 || res.statusCode == 201) {
        if (res.data is String) {
          return ApiResponse(
            data: jsonDecode(
                  res.data,
                )["data"] ??
                res.data,
            message: res.data["message"],
            status: res.data["status"],
          );
        } else {
          return ApiResponse(
              data: res.data["data"] ?? res.data,
              message: res.data["message"],
              status: res.data["status"]);
        }
      }
      throw Failure(res.statusMessage!, extraData: res.data);
    } on DioException catch (e) {
      throw convertException(e);
    } catch (e) {
      _logger.e(e.toString());
      throw Failure(e.toString());
    }
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> post(String url,
      {dynamic body, Map<String, String>? headers}) async {
    _logger.i("received post url is $url");
    try {
      if (headers != null) {
        _headers.addAll(headers);
      }
      Logger().i("Set post data: $body");
      final res = await _dio.post(
        url,
        data: body,
        options: Options(headers: _headers),
      );

      _logger.d("Post Response: $res");

      if (res.statusCode == 200 || res.statusCode == 201) {
        if (res.data is String) {
          return ApiResponse(
            data: jsonDecode(
                  res.data,
                )["data"] ??
                res.data,
            message: jsonDecode(
              res.data,
            )["message"],
            status: jsonDecode(
              res.data,
            )["status"],
          );
        } else {
          return ApiResponse(
              data: res.data['data'] ?? res.data,
              message: res.data['message'],
              status: res.data['status']);
        }
      }
      throw Failure(res.statusMessage!);
    } on DioException catch (e) {
      throw convertException(e);
    } catch (e) {
      _logger.e(e.toString());
      throw Failure(e.toString());
    }
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> postFile(
      {required String url,
      required String key,
      required File file,
      Map<String, String>? headers}) async {
    try {
      if (headers != null) {
        _headers.addAll(headers);
      }
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        key: await MultipartFile.fromFile(file.path, filename: fileName),
      });

      final res = await _dio.post(
        url,
        data: formData,
        options: Options(headers: _headers),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return ApiResponse(data: res.data);
      }
      throw Failure(res.statusMessage!);
    } on DioException catch (e) {
      throw convertException(e);
    } catch (e) {
      _logger.e(e.toString());
      throw Failure(e.toString());
    }
  }

  Failure convertException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const Failure("Connection Timed Out");
      case DioExceptionType.sendTimeout:
        return const Failure("Connection Timed Out");
      case DioExceptionType.receiveTimeout:
        return const Failure("Connection Timed Out");
      case DioExceptionType.badResponse:
        return Failure(
            e.response?.data['message'] ?? e.response?.data['errors']);
      case DioExceptionType.cancel:
        return Failure(
            e.response?.data['message'] ?? e.response?.data['errors']);
      case DioExceptionType.unknown:
        return Failure(e.toString());
      default:
        return const Failure("No Internet Connection");
    }
  }

  Future _updateConnectionStatus(List<ConnectivityResult> event) async {
    _connectionStatus.value = event;
    if (event.contains(ConnectivityResult.none)) {
      _logger.e("No Internet Connection");
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();

      if (result.any((element) => element == ConnectivityResult.none)) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
