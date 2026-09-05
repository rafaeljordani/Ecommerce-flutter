import 'package:ecommerce/features/home/controllers/home_controller.dart';
import 'package:ecommerce/features/home/models/product_model.dart';
import 'package:ecommerce/shared/mocks.dart';
import 'package:flutter/material.dart';

class ProductsByCategoryController extends ChangeNotifier {
  List<Product> productList = [];
  List<Product> searchList = [];
  List<String> brandList = [];
  ProductsViewState productsState = ProductsViewState.loading;
  String search = '';

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
    brandList = [];
    search = '';
    changeProductsState(ProductsViewState.loading);
    await Future.delayed(const Duration(seconds: 3));

    try {
      productList = productsJson
          .where((items) {
            return items['category'].toString().toLowerCase() ==
                category.toLowerCase();
          })
          .map((items) {
            brandList.add(items['brand']);
            return Product.fromJson(items);
          })
          .toList();
      brandList = brandList.toSet().toList();
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
