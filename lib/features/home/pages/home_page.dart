import 'package:ecommerce/features/home/controllers/home_controller.dart';
import 'package:ecommerce/features/login/controllers/login_controller.dart';
import 'package:ecommerce/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    context.read<HomeController>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<LoginController>(
          builder: (context, loginController, child) {
            return Text('Olá, ${loginController.user!.name}');
          },
        ),
        actions: const [Icon(Icons.shopping_cart_outlined)],
      ),
      body: Consumer<HomeController>(
        builder: (context, homeController, child) {
          return Column(
            children: [
              SizedBox(
                height: 108,
                child: switch (homeController.categoriesState) {
                  CategoriesViewState.loading => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  CategoriesViewState.error => const Text(
                    'Problema ao resgatar categorias',
                  ),
                  CategoriesViewState.success => Container(
                    color: AppColors.red,
                    width: 100,
                    height: 100,
                  ),
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
