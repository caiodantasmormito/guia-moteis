import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:guia_moteis/app_flavor.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _baseOptions = BaseOptions(
  baseUrl: AppFlavor.shared.baseUrl,
  headers: {'Content-Type': 'application/json'},
  connectTimeout: const Duration(milliseconds: 30000),
  receiveTimeout: const Duration(milliseconds: 30000),
);

class HttpClient extends DioForNative {
  HttpClient() : super(_baseOptions) {
    final io = httpClientAdapter as IOHttpClientAdapter;
    io.onHttpClientCreate = (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return null;
    };
  }
}

class AuthenticatedClient extends HttpClient {
  AuthenticatedClient({required this.sharedPreferences}) : super();
  final SharedPreferences sharedPreferences;

  @override
  Interceptors get interceptors => super.interceptors
    ..add(AuthenticateInterceptor(sharedPreferences: sharedPreferences));
}

class AuthenticateInterceptor extends Interceptor {
  const AuthenticateInterceptor({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      log('BaseUrl: ${options.baseUrl}');
      log('URL: ${options.path}');
      log('HEADERS: ${options.headers.toString()}');
    }
    final token = sharedPreferences.getString('token');
    if (token != null) {
      options.headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      log('BODY: ${response.data.toString()}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      log(
        err.message ?? '',
      );
      log(
        err.toString(),
      );
      log(err.message ?? '', error: err.error);
    }
    super.onError(err, handler);
  }
}
