import 'package:urecord/src/features/auth/domain/entities/auth_token_entity.dart';

class AuthTokenModel extends AuthTokenEntity {
  const AuthTokenModel({
    required super.accessToken,
    required super.refreshToken,
  });

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) => AuthTokenModel(
    accessToken: json['access_token'],
    refreshToken: json['refresh_token'],
  );
}
