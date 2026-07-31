import 'package:ecommerce/pages/login_page.dart';
import 'package:ecommerce/pages/signup_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    LoginPage.route: (context) => const LoginPage(),
    SignupPage.route: (context) => const SignupPage(),
  };
}
