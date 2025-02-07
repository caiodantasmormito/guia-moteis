import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:guia_moteis/core/infra/http/http_client.dart';
import 'package:guia_moteis/features/home/data/datasource/motel_datasource.dart';
import 'package:guia_moteis/features/home/data/exceptions/exceptions.dart';
import 'package:guia_moteis/features/home/data/model/motel_model.dart';

class MotelDatasourceImpl implements MotelDataSource {
  final HttpClient _httpClient;

  MotelDatasourceImpl({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<MotelDataModel> getMotel() async {
    try {
      final Response response = await _httpClient.get(
        '/b/1IXK',
      );

      return MotelDataModel.fromJson(
        response.data['data'],
      );
    } on DioException catch (e, s) {
      if (kDebugMode) {
        debugPrintStack(label: e.toString(), stackTrace: s);
      }
      final Map<String, dynamic> errors = e.response!.data['errors'];

      throw GetMotelException(
        message: errors.toString(),
      );
    } catch (e) {
      throw const GetMotelException(
        message: 'Erro inesperado',
      );
    }
  }
}
