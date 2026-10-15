import 'package:dio/dio.dart';

/// Erro de transporte independente do pacote usado para fazer as requisições.
class EcomHttpException implements Exception {
  const EcomHttpException({
    this.statusCode,
    this.data,
    this.message,
  });

  final int? statusCode;
  final dynamic data;
  final String? message;

  @override
  String toString() => message ?? 'Erro ao fazer requisição HTTP';
}

class EcomHttpResponse {
  const EcomHttpResponse({required this.data, required this.statusCode});

  final dynamic data;
  final int? statusCode;
}

/// Contrato HTTP usado pelos serviços da aplicação.
abstract interface class EcomHttpClient {
  Future<EcomHttpResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  });

  Future<EcomHttpResponse> post(String path, {dynamic data});

  Future<EcomHttpResponse> put(String path, {dynamic data});
}

/// Implementação atual do contrato usando Dio.
class DioEcomHttpClient implements EcomHttpClient {
  DioEcomHttpClient({Dio? dio}) : _dio = dio ?? Dio(_options);

  static const String baseUrl =
      'https://api-production-c0289.up.railway.app/api/v1/';

  static final BaseOptions _options = BaseOptions(
    baseUrl: baseUrl,
    headers: const {'Content-Type': 'application/json'},
  );

  final Dio _dio;

  @override
  Future<EcomHttpResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) =>
      _send(() async {
        final response = await _dio.get<dynamic>(
            path,
            queryParameters: queryParameters,
          );
        return EcomHttpResponse(
          data: response.data,
          statusCode: response.statusCode,
        );
      });

  @override
  Future<EcomHttpResponse> post(String path, {dynamic data}) =>
      _send(() async {
        final response = await _dio.post<dynamic>(path, data: data);
        return EcomHttpResponse(
          data: response.data,
          statusCode: response.statusCode,
        );
      });

  @override
  Future<EcomHttpResponse> put(String path, {dynamic data}) =>
      _send(() async {
        final response = await _dio.put<dynamic>(path, data: data);
        return EcomHttpResponse(
          data: response.data,
          statusCode: response.statusCode,
        );
      });

  Future<EcomHttpResponse> _send(
    Future<EcomHttpResponse> Function() request,
  ) async {
    try {
      return await request();
    } on DioException catch (error) {
      throw EcomHttpException(
        statusCode: error.response?.statusCode,
        data: error.response?.data,
        message: error.message,
      );
    }
  }
}
