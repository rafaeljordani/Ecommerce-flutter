import 'package:ecommerce/features/login/model/auth_user.dart';
import 'package:dio/dio.dart';

class SignupService {
  String baseUrl = "https://api-production-c0289.up.railway.app/api/v1/";

  Future<AuthUser> registerUser(
    String name,
    String email,
    String password,
    String confirmPassword,
    bool acceptedTerms,
  ) async {
    final dio = Dio();

    final response = await dio.post(
      '${baseUrl}auth/register',
      data: {
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "acceptedTerms": acceptedTerms,
      },
    );

    if (response.statusCode != 201) throw Exception(response.data['message']);
    return AuthUser.fromJson(response.data);
  }
}
