import 'package:ecommerce/features/home/models/category_model.dart';
import 'package:ecommerce/features/home/models/product_model.dart';
import 'package:ecommerce/features/home/services/category_services.dart';
import 'package:ecommerce/features/home/services/products_services.dart';
import 'package:ecommerce/features/login/controllers/login_controller.dart';
import 'package:ecommerce/shared/ecom_http_client.dart';
import 'package:flutter/material.dart';

enum CategoriesViewState { loading, success, error }

enum ProductsViewState { loading, success, error }

class HomeController extends ChangeNotifier {
  List<Category> categories = [];
  List<Product> products = [];

  CategoriesViewState categoriesState = CategoriesViewState.loading;
  ProductsViewState productsState = ProductsViewState.loading;

  CategoryServices categoryServices = CategoryServices();
  ProductsServices productsServices = ProductsServices();

  void changeCategoriesState(CategoriesViewState state) {
    categoriesState = state;
    notifyListeners();
  }

  void changeProductsState(ProductsViewState state) {
    productsState = state;
    notifyListeners();
  }

  Future getCategories() async {
    changeCategoriesState(CategoriesViewState.loading);

    try {
      categories = await categoryServices.getCategories();
      changeCategoriesState(CategoriesViewState.success);
    } on EcomHttpException catch (e) {
      changeCategoriesState(CategoriesViewState.error);
      throw LoginException(
        (e.data is Map ? e.data['message']?.toString() : null) ??
            e.message ??
            'Erro desconhecido',
      );
    } catch (_) {
      changeCategoriesState(CategoriesViewState.error);
    }
  }

  Future getProducts() async {
    changeProductsState(ProductsViewState.loading);
    try {
      products = await productsServices.getProducts();
      changeProductsState(ProductsViewState.success);
    } on EcomHttpException catch (e) {
      changeProductsState(ProductsViewState.error);
      throw LoginException(
        (e.data is Map ? e.data['message']?.toString() : null) ??
            e.message ??
            'Erro desconhecido',
      );
    } catch (_) {
      changeProductsState(ProductsViewState.error);
    }
  }
}
