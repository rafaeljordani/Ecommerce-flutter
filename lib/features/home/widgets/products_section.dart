import 'package:ecommerce/features/home/controllers/home_controller.dart';
import 'package:ecommerce/features/home/models/product_model.dart';
import 'package:ecommerce/shared/widgets/card_products.dart';
import 'package:ecommerce/shared/mocks.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({
    super.key,
    required this.products,
    required this.viewState,
  });

  final List<Product> products;
  final ProductsViewState viewState;

  @override
  Widget build(BuildContext context) {
    if (viewState == ProductsViewState.error) return const Text('Erro');

    return Skeletonizer(
      enabled: viewState == ProductsViewState.loading,
      child: SizedBox(
        height: 300,
        child: ListView.builder(
          itemCount: _getProductsList().length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final category = _getProductsList()[index];
            return CardProducts(product: category);
          },
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
