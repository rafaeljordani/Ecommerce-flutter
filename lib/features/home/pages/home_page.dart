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
                    padding: EdgeInsets.only(right: 24),
                    child: Container(
                      height: 150,
                      width: 350,
                      decoration: BoxDecoration(
                        color: AppColors.grey100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'Aproveite as \n ofertas',
                        style: AppTextStyle.title,
                      ),
                    ),
                  ),
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
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: AppElevatedButton(
                      type: ButtonType.filled,
                      textButton: 'Carregar',
                      onPressed: () {
                        homeController.getCategories();
                        homeController.getProducts();
                      },
                    ),
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
