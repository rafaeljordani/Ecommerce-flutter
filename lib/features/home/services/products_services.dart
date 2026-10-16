import 'package:ecommerce/features/home/models/product_model.dart';
import 'package:ecommerce/shared/ecom_http_client.dart';

class ProductsServices {
  ProductsServices({EcomHttpClient? httpClient})
    : _httpClient = httpClient ?? DioEcomHttpClient();

  final EcomHttpClient _httpClient;

  Future<List<Product>> getProducts() async {
    final response = await _httpClient.get('products');

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
        .map((json) => Product.fromJson(json))
        .toList();
  }

  Future<List<Product>> getProductsByCategory(String id) async {
    final response = await _httpClient.get('products?categoryId=$id');

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
        .map((json) => Product.fromJson(json))
        .toList();
  }
}
