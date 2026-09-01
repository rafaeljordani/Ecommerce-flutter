import 'package:ecommerce/features/home/controllers/home_controller.dart';
import 'package:ecommerce/features/home/models/category_model.dart';
import 'package:ecommerce/features/home/widgets/card_categories.dart';
import 'package:ecommerce/shared/mocks.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
    required this.viewState,
    required this.categories,
  });

  final List<Category> categories;
  final CategoriesViewState viewState;

  @override
  Widget build(BuildContext context) {
    if (viewState == CategoriesViewState.error) return const Text('Erro');

    return Skeletonizer(
      enabled: viewState == CategoriesViewState.loading,
      child: SizedBox(
        height: 150,
        child: ListView.builder(
          itemCount: _getCategoriesList().length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final category = _getCategoriesList()[index];
            return CardCategory(category: category);
          },
        ),
      ),
    );
  }

  List<Category> _getCategoriesList() {
    return viewState == CategoriesViewState.loading
        ? fakeLoadingCategories
        : categories;
  }
}
