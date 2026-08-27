import 'package:ecommerce/features/home/controllers/home_controller.dart';
import 'package:ecommerce/features/home/models/category_model.dart';
import 'package:ecommerce/features/home/models/product_model.dart';
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
                  Padding(
                    padding: EdgeInsetsGeometry.only(right: 24),
                    child: Container(
                      height: 150,
                      width: 350,
                      decoration: BoxDecoration(
                        color: AppColors.grey100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(width: 10, color: AppColors.black),
                    ),
                  ),
                  const AppTextFieldExtends(text: 'Categorias'),
                  SizedBox(
                    child: switch (homeController.categoriesState) {
                      CategoriesViewState.loading => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      CategoriesViewState.error => const Text(
                        'Problema ao resgatar categorias',
                      ),
                      CategoriesViewState.success => SizedBox(
                        height: 150,
                        child: ListView.builder(
                          itemCount: homeController.categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            Category category =
                                homeController.categories[index];
                            return Container(
                              margin: const EdgeInsets.only(right: 5, top: 10),
                              height: 50,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Image.network(category.imageUrl),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      category.name,
                                      style: AppTextStyle.subTitle,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    },
                  ),
                  const AppTextFieldExtends(text: 'Produtos'),
                  SizedBox(
                    child: switch (homeController.productsState) {
                      ProductsViewState.loading => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      ProductsViewState.error => const Text(
                        'Problema ao resgatar produtos',
                      ),
                      ProductsViewState.success => SizedBox(
                        height: 250,
                        child: ListView.builder(
                          itemCount: homeController.products.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            Product product = homeController.products[index];
                            return Container(
                              margin: const EdgeInsets.only(right: 10, top: 10),
                              height: 50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(product.imageUrl),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      product.brand,
                                      style: AppTextStyle.texSpanGrey,
                                    ),
                                  ),
                                  Text(
                                    product.name,
                                    style: AppTextStyle.subTitle,
                                  ),
                                  Text(
                                    '\$${product.price.toString()}',
                                    style: AppTextStyle.textPrice,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    },
                  ),
                  AppElevatedButton(
                    type: ButtonType.filled,
                    textButton: 'Carregar',
                    onPressed: () {
                      homeController.getCategories();
                      homeController.getProducts();
                    },
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
