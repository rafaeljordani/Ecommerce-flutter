import 'package:ecommerce/features/home/controllers/home_controller.dart';
import 'package:ecommerce/features/home/controllers/products_by_category_controller.dart';
import 'package:ecommerce/features/home/widgets/products_by_category_section.dart';
import 'package:ecommerce/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsByCategoryPage extends StatefulWidget {
  const ProductsByCategoryPage({super.key, required this.categoryName});

  final String categoryName;
  static String route = '/productsByCategory';

  @override
  State<ProductsByCategoryPage> createState() => _ProductsByCategoryPageState();
}

class _ProductsByCategoryPageState extends State<ProductsByCategoryPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
      context.read<ProductsByCategoryController>().getProducts(
        widget.categoryName,
      );
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        actions: const [Icon(Icons.shopping_cart_outlined, size: 28)],
      ),
      body: Consumer<ProductsByCategoryController>(
        builder: (context, controller, child) {
          // print(controller.brandList);

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                AppTextField(
                  hintText: 'Rabanete',
                  onChanged: (value) {
                    controller.getSearch(value);
                  },
                ),
                if (controller.productsState == ProductsViewState.success)
                  DropdownButtonFormField(
                    initialValue: 'Filtro',
                    items: [
                      const DropdownMenuItem(
                        child: Text('Filtro'),
                        value: 'Filtro',
                      ),
                      ...controller.brandList.map(
                        (e) =>
                            DropdownMenuItem<String>(child: Text(e), value: e),
                      ),
                    ],
                    onChanged: (value) {
                      controller.setBrandSearch(value ?? 'Filtro');
                    },
                  ),
                ProductsByCategorySection(
                  products: controller.searchList,
                  viewState: controller.productsState,
                  categoryName: widget.categoryName,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
