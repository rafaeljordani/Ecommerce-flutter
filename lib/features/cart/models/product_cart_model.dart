import 'package:ecommerce/features/home/models/product_model.dart';

class ProductCart extends Product {
  ProductCart({
    required super.name,
    required super.imageUrl,
    required super.brand,
    required super.price,
    required super.category,
    this.quantity = 0,
  });
  int quantity;
  double? get subtotal {
    return quantity * price;
  }

  factory ProductCart.fromProduct(Product product) {
    return ProductCart(
      name: product.name,
      imageUrl: product.imageUrl,
      brand: product.brand,
      price: product.price,
      category: product.category,
      quantity: 1,
    );
  }
}
