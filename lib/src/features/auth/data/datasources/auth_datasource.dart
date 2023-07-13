import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:urecord/src/common/data/datasources/remote_datasource.dart';
import 'package:urecord/src/features/auth/data/models/auth_token_model.dart';
import 'package:urecord/src/features/auth/domain/entities/auth_token_entity.dart';
import 'package:urecord/src/utils/http/api.dart';

abstract class AuthDataSource {
  Future<void> register({
    required String email,
    required String password,
  });

  Future<AuthTokenEntity> login({
    required String email,
    required String password,
  });

  Future<void> setAuthToken(AuthTokenEntity authToken);

  Future<void> storeAuthToken(AuthTokenEntity authToken);

  Future<AuthTokenEntity?> getAuthToken();

  Future<void> logout();
}

class RemoteAuthDataSource extends RemoteDataSource implements AuthDataSource {
  static const String _accessTokenName = 'ACCESS_TOKEN';
  static const String _refreshTokenName = 'REFRESH_TOKEN';

  final FlutterSecureStorage secureStorage;

  const RemoteAuthDataSource({
    required super.api,
    required this.secureStorage,
  });

  @override
  Future<AuthTokenEntity> login({
    required String email,
    required String password,
  }) async {
    final response = await api.request(
      HTTPMethod.post,
      '/auth/signin',
      data: {
        "email": email,
        "password": password,
      },
    );

    return AuthTokenModel.fromJson(response.data);
  }

  @override
  Future<void> register({
    required String email,
    required String password,
  }) async {
    final response = await api.request(
      HTTPMethod.post,
      '/auth/signup',
      data: {
        "email": email,
        "password": password,
      },
    );
  }

  @override
  Future<AuthTokenEntity?> getAuthToken() async {
    final List<String?> tokens = await Future.wait<String?>([
      secureStorage.read(key: _accessTokenName),
      secureStorage.read(key: _refreshTokenName),
    ]);

    final String? accessToken = tokens[0];
    if (accessToken is! String) {
      return null;
    }

    return AuthTokenEntity(
      accessToken: accessToken,
      refreshToken: tokens[1],
    );
  }

  @override
  Future<void> setAuthToken(AuthTokenEntity authToken) async {
    api.setAccessToken(authToken.accessToken);
    api.setRefreshToken(authToken.refreshToken);
  }

  @override
  Future<void> storeAuthToken(AuthTokenEntity authToken) async {
    await Future.wait([
      secureStorage.write(
        key: _accessTokenName,
        value: authToken.accessToken,
      ),
      if (authToken.refreshToken is String)
        secureStorage.write(
          key: _refreshTokenName,
          value: authToken.refreshToken,
        ),
    ]);
  }

  @override
  Future<void> logout() async {
    await Future.wait([
      secureStorage.deleteAll(),
      api.request(HTTPMethod.get, '/auth/signout'),
    ]);
  }
}
