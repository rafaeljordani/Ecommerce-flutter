import 'package:ecommerce/features/home/controllers/home_controller.dart';
import 'package:ecommerce/features/home/models/product_model.dart';
import 'package:ecommerce/shared/mocks.dart';
import 'package:flutter/material.dart';

class ProductsByCategoryController extends ChangeNotifier {
  List<Product> products = [];
  List<Product> searchList = [];
  ProductsViewState productsState = ProductsViewState.loading;

  void changeProductsState(ProductsViewState state) {
    productsState = state;
    notifyListeners();
  }

  void getSearch(String text) {
    try {
      searchList = products.where((items) {
        print('ola');
        return items.name.toString().toLowerCase().contains(text.toLowerCase());
      }).toList();
      changeProductsState(ProductsViewState.success);
    } catch (e) {
      changeProductsState(ProductsViewState.error);
    }
  }

  void getProducts(String category) async {
    changeProductsState(ProductsViewState.loading);
    await Future.delayed(const Duration(seconds: 3));

    try {
      products = productsJson
          .where((items) {
            return items['category'].toString().toLowerCase() ==
                category.toLowerCase();
          })
          .map((items) {
            return Product.fromJson(items);
          })
          .toList();
      searchList = List.from(products);
      changeProductsState(ProductsViewState.success);
    } catch (e) {
      changeProductsState(ProductsViewState.error);
    }
  }
}
