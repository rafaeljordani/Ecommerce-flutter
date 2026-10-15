import 'package:ecommerce/shared/ecom_http_client.dart';

class SignupService {
  SignupService({EcomHttpClient? httpClient})
      : _httpClient = httpClient ?? DioEcomHttpClient();

  final EcomHttpClient _httpClient;

  Future<void> registerUser(
    String name,
    String email,
    String password,
    String confirmPassword,
    bool acceptedTerms,
  ) async {
    final response = await _httpClient.post(
      'auth/register',
      data: {
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "acceptedTerms": acceptedTerms,
      },
    );

    if (response.statusCode != 201) {
      final message = response.data is Map
          ? response.data['message']?.toString()
          : null;
      throw EcomHttpException(
        statusCode: response.statusCode,
        data: response.data,
        message: message ?? 'Não foi possível criar a conta',
      );
    }

  }
}
