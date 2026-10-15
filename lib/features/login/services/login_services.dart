import 'package:ecommerce/features/login/model/auth_user.dart';
import 'package:ecommerce/shared/ecom_http_client.dart';

class LoginServices {
  LoginServices({EcomHttpClient? httpClient})
    : _httpClient = httpClient ?? DioEcomHttpClient();

  final EcomHttpClient _httpClient;

  Future<AuthUser> loginUser(String email, String password) async {
    final response = await _httpClient.post(
      'auth/login',
      data: {"email": email, "password": password},
    );

    if (response.statusCode != 200) {
      final message = response.data is Map
          ? response.data['message']?.toString()
          : null;
      throw EcomHttpException(
        statusCode: response.statusCode,
        data: response.data,
        message: message ?? 'Não foi possível fazer login',
      );
    }

    AuthUser user = AuthUser.fromJson(response.data);
    return user;
  }
}
