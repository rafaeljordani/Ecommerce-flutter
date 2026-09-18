import 'package:ecommerce/features/cart/models/product_cart_model.dart';
import 'package:ecommerce/features/home/models/product_model.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
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

  void removeProducFromList(Product product) {
    ProductCart? productExistent = validationProduct(product);
    productsCard.removeAt(productsCard.indexOf(productExistent!));
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

  double get totalPriceCart {
    return productsCard.fold(0, (sun, item) => sun + item.subtotal!);
  }
}
