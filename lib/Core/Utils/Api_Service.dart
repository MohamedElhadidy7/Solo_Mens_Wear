import 'package:dio/dio.dart';

class Apiservice {
  Apiservice(this._dio) {
    _dio.options.headers = {};
  }

  final Dio _dio;
  final _baseUrl = "http://bi3ly.runasp.net/";

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    final response = await _dio.get('$_baseUrl$endpoint');
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    FormData formData = FormData.fromMap(data ?? {});

    final response = await _dio.post(
      '$_baseUrl$endpoint',
      data: formData,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
