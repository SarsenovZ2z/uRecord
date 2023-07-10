enum HTTPMethod { get, post, delete, put, patch }

abstract class Api {

  Future<dynamic> request<T>(
      HTTPMethod method,
      String path, {
        Map<String, dynamic>? data,
      });

  void setAccessToken(String? accessToken);

  void setRefreshToken(String? refreshToken);

  bool get isSignedIn;
}
