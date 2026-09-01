import 'package:ecommerce/features/home/controllers/home_controller.dart';
import 'package:ecommerce/features/home/models/product_model.dart';
import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/widgets/card_products.dart';
import 'package:ecommerce/shared/mocks.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsByCategorySection extends StatelessWidget {
  const ProductsByCategorySection({
    super.key,
    required this.products,
    required this.viewState,
    required this.categoryName,
  });

  final List<Product> products;
  final ProductsViewState viewState;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    if (viewState == ProductsViewState.error) return const Text('Erro');

    return Expanded(
      child: Skeletonizer(
        enabled: viewState == ProductsViewState.loading,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GridView.builder(
            itemCount: _getProductsList().length,
            itemBuilder: (context, index) {
              final category = _getProductsList()[index];
              return CardProducts(product: category);
            },
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
              mainAxisExtent: 260,
              crossAxisSpacing: 5,
            ),
          ),
        ),
      ),
    );
  }

  List<Product> _getProductsList() {
    return viewState == ProductsViewState.loading
        ? fakeLoadingProducts
        : products;
  }
}
