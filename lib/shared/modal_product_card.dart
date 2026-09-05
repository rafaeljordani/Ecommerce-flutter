import 'package:ecommerce/features/home/models/product_model.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';

class ModalProductCard extends StatelessWidget {
  const ModalProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.4,
      width: MediaQuery.of(context).size.width,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(product.imageUrl.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(product.name, style: AppTextStyle.title),

            Text(product.brand, style: AppTextStyle.texModelGrey),

            Text(
              style: AppTextStyle.textModel,
              'A acerola é uma fruta tropical conhecida pelo seu sabor refrescante, levemente ácido e naturalmente adocicado. Rica em vitamina C e muito versátil, pode ser consumida in natura, utilizada em sucos, vitaminas, sobremesas e diversas receitas.Ideal para quem busca uma opção saborosa e nutritiva para o dia a dia. Produto selecionado para garantir qualidade, frescor e sabor.',
            ),
            const SizedBox(height: 10),
            Text(
              'R\$${product.price.toString()}',
              style: AppTextStyle.textPriceModal,
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: AppElevatedButton(
                type: ButtonType.filled,
                textButton: 'Adicionar ao carrinho',
                onPressed: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
