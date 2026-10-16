import 'package:ecommerce/features/cart/pages/Checkout_page.dart';
import 'package:ecommerce/features/cart/pages/cart_page.dart';
import 'package:ecommerce/features/home/models/category_model.dart';
import 'package:ecommerce/features/home/pages/home_page.dart';
import 'package:ecommerce/features/login/pages/login_page.dart';
import 'package:ecommerce/features/home/pages/products_by_category_page.dart';
import 'package:ecommerce/features/recover/pages/recover_page.dart';
import 'package:ecommerce/features/singnup/pages/signup_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    LoginPage.route: (context) => const LoginPage(),
    SignupPage.route: (context) => const SignupPage(),
    RecoverPage.route: (context) => const RecoverPage(),
    HomePage.route: (context) => const HomePage(),
    ProductsByCategoryPage.route: (context) {
      final category = ModalRoute.of(context)!.settings.arguments as Category;
      return ProductsByCategoryPage(category: category);
    },
    CartPage.route: (context) => const CartPage(),
    CheckoutPage.route: (context) => const CheckoutPage(),
  };
}
