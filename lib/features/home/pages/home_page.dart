import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/features/home/controllers/home_controller.dart';
import 'package:ecommerce/features/home/widgets/categories_section.dart';
import 'package:ecommerce/features/home/widgets/products_section.dart';
import 'package:ecommerce/features/login/controllers/login_controller.dart';
import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/shared/widgets/app_text_field_extends.dart';
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
    WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
      context.read<HomeController>()
        ..getCategories()
        ..getProducts();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => Dialog(
                  child: Container(
                    height: 200,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      spacing: 20,
                      children: [
                        const Spacer(),
                        const Text(
                          'Porfavor cofirme',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Voce tem certeza de fechar o aplicativo',
                          style: TextStyle(fontSize: 14),
                        ),
                        const Spacer(),
                        Row(
                          spacing: 20,
                          children: [
                            Expanded(
                              child: AppElevatedButton(
                                type: ButtonType.dialogButton,
                                textButton: 'Voltar',
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            Expanded(
                              child: AppElevatedButton(
                                type: ButtonType.dialogButton,
                                textButton: 'Fechar app',
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  exit(0);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        title: Consumer<LoginController>(
          builder: (context, loginController, child) {
            return Text('Olá, ${loginController.user!.name}');
          },
        ),
        actions: const [Icon(Icons.shopping_cart_outlined, size: 28)],
      ),
      body: Consumer<HomeController>(
        builder: (context, homeController, child) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(right: 24)),
                  const AppTextFieldExtends(text: 'Categorias'),
                  CategoriesSection(
                    categories: homeController.categories,
                    viewState: homeController.categoriesState,
                  ),
                  const AppTextFieldExtends(text: 'Produtos'),
                  ProductsSection(
                    products: homeController.products,
                    viewState: homeController.productsState,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
