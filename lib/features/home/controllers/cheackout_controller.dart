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
  final int quantity;
}

class CheackoutController extends ChangeNotifier {
  List<ProductCart> productsCard = [];

  void addProductModels(Product product) {
    if (productsCard.isNotEmpty) {
      productsCard.where((items) {
        print('entrou');
        return items.name == product.name;
      });
    } else {
      productsCard.add(
        ProductCart(
          name: product.name,
          imageUrl: product.imageUrl,
          brand: product.brand,
          price: product.price,
          category: product.category,
          quantity: 1,
        ),
      );
      print(productsCard[0].name);
    }

    // if (productsCard.any((element) => element.name == product.name,)){

    // }
    // if(product.name == productsCard.){}
  }
}
