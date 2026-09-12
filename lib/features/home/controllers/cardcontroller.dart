import 'package:ecommerce/features/home/models/product_model.dart';
import 'package:flutter/material.dart';

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

class CardController extends ChangeNotifier {
  List<ProductCart> productsCard = [];

  bool hasProduct(Product product) {
    return productsCard.any((item) => product.name == item.name);
  }

  int getQuatity(Product product) {
    ProductCart? productExistent = validationProduct(product);
    return productExistent!.quantity;
  }

  void incrementProduct(Product product) {
    ProductCart? productExistent = validationProduct(product);
    productExistent!.quantity++;
    notifyListeners();
  }

  void decrement(Product product) {
    ProductCart? productExistent = validationProduct(product);
    productExistent!.quantity--;
    notifyListeners();
  }

  void addProductModels(Product product) {
    productsCard.add(ProductCart.fromProduct(product));
    notifyListeners();
  }

  ProductCart? validationProduct(Product product) {
    ProductCart? productExistent = productsCard.where((items) {
      return items.name == product.name;
    }).firstOrNull;
    return productExistent;
  }
}
