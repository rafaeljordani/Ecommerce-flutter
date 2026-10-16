import 'package:ecommerce/features/home/controllers/home_controller.dart';
import 'package:ecommerce/features/home/models/product_model.dart';
import 'package:ecommerce/features/home/data/mocks.dart';
import 'package:ecommerce/features/home/services/products_services.dart';
import 'package:flutter/material.dart';

class ProductsByCategoryController extends ChangeNotifier {
  List<Product> productList = [];
  List<Product> searchList = [];
  List<String> brandList = [];
  ProductsViewState productsState = ProductsViewState.loading;
  String search = '';

  ProductsServices productsServices = ProductsServices();

  void changeProductsState(ProductsViewState state) {
    productsState = state;
    notifyListeners();
  }

  void getSearch(String text) {
    search = text;
    try {
      searchList = productList.where((items) {
        return items.name.toString().toLowerCase().contains(text.toLowerCase());
      }).toList();
      changeProductsState(ProductsViewState.success);
    } catch (e) {
      changeProductsState(ProductsViewState.error);
    }
  }

  void getProducts(String category) async {
    search = '';
    changeProductsState(ProductsViewState.loading);
    await Future.delayed(const Duration(seconds: 3));

    try {
      productList = await productsServices.getProductsByCategory(category);
      brandList = productList.map((e) => e.brand).toSet().toList();
      searchList = List.from(productList);
      changeProductsState(ProductsViewState.success);
    } catch (e) {
      changeProductsState(ProductsViewState.error);
    }
  }

  void setBrandSearch(String brand) {
    if (brand == 'Filtro') {
      if (search.isNotEmpty) {
        getSearch(search);
        return;
      }
      searchList = productList;
      return;
    }

    searchList = productList.where((items) {
      if (search.isNotEmpty) {
        return items.name.toString().toLowerCase().contains(
              search.toLowerCase(),
            ) &&
            items.brand.toLowerCase() == brand.toLowerCase();
      }
      return items.brand.toLowerCase() == brand.toLowerCase();
    }).toList();

    notifyListeners();
  }
}
