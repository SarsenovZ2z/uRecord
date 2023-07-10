import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:urecord/src/utils/http/api.dart';

class DioApi implements Api {
  String? _accessToken;
  String? _refreshToken;
  late final Dio httpClient;

  DioApi() {
    httpClient = Dio(
      BaseOptions(
        listFormat: ListFormat.multiCompatible,
        baseUrl: dotenv.get('BACKEND_URL'),
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    httpClient.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_accessToken != null) {
            options.headers['Authorization'] = "Bearer $_accessToken";
          }

          debugPrint('sending request to: ${options.path}');

          return handler.next(options);
        },
      ),
    );
  }

  @override
  bool get isSignedIn => _accessToken != null;

  @override
  Future<Response<T>> request<T>(
      HTTPMethod method,
      String path, {
        Map<String, dynamic>? data,
      }) async {
    switch (method) {
      case HTTPMethod.get:
        return httpClient.get<T>(path, queryParameters: data);
      case HTTPMethod.post:
        return httpClient.post<T>(path, data: data);
      case HTTPMethod.put:
        return httpClient.put<T>(path, data: data);
      case HTTPMethod.delete:
        return httpClient.delete<T>(path, data: data);
      default:
        throw UnimplementedError();
    }
  }

  @override
  void setAccessToken(String? accessToken) {
    _accessToken = accessToken;
  }

  @override
  void setRefreshToken(String? refreshToken) {
    _refreshToken = refreshToken;
  }
}
