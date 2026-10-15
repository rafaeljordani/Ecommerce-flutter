import 'package:ecommerce/features/home/models/category_model.dart';
import 'package:ecommerce/shared/ecom_http_client.dart';

class CategoryServices {
  CategoryServices({EcomHttpClient? httpClient})
    : _httpClient = httpClient ?? DioEcomHttpClient();

  final EcomHttpClient _httpClient;

  Future<List<Category>> getCategories() async {
    final response = await _httpClient.get('categories');

    if (response.statusCode != 200) {
      final message = response.data is Map
          ? response.data['message']?.toString()
          : null;
      throw EcomHttpException(
        statusCode: response.statusCode,
        data: response.data,
        message: message ?? 'Não foi possivel encontrar',
      );
    }
    return (response.data['data'] as List)
        .map((json) => Category.fromJson(json))
        .toList();
  }
}
