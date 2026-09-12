import 'package:ecommerce/features/home/controllers/cardcontroller.dart';
import 'package:ecommerce/features/home/controllers/home_controller.dart';
import 'package:ecommerce/features/login/controllers/login_controller.dart';
import 'package:ecommerce/features/login/pages/login_page.dart';
import 'package:ecommerce/features/home/controllers/products_by_category_controller.dart';
import 'package:ecommerce/features/singnup/controllers/singn_up_controller.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return LoginController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return HomeController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return SingnUpController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ProductsByCategoryController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return CardController();
          },
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          routes: AppRoutes.routes,
          initialRoute: LoginPage.route,
        );
      },
    );
  }
}
