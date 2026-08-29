import 'package:ecommerce/features/home/controllers/home_controller.dart';
import 'package:ecommerce/features/home/models/category_model.dart';
import 'package:ecommerce/features/home/models/product_model.dart';
import 'package:ecommerce/shared/mocks.dart';
import 'package:flutter/material.dart';

class ProductsByCategoryController extends ChangeNotifier {
  List<Product> products = [];

  ProductsViewState productsState = ProductsViewState.loading;

  void changeProductsState(ProductsViewState state) {
    productsState = state;
    notifyListeners();
  }

  void getProducts() async {
    changeProductsState(ProductsViewState.loading);
    await Future.delayed(const Duration(seconds: 3));

    try {
      products = productsJson.map((item) {
        print(item);
        final numeros = [1, 2, 3, 4, 5];

        {
          return Product.fromJson(item);
        }
      }).toList();
      changeProductsState(ProductsViewState.success);
    } catch (e) {
      changeProductsState(ProductsViewState.error);
    }
  }
}
