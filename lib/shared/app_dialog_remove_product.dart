import 'package:ecommerce/features/cart/controllers/cartcontroller.dart';

import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDialogRemoveProduct extends StatelessWidget {
  const AppDialogRemoveProduct({super.key, required this.nameProduct});

  final String nameProduct;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, controller, child) {
        return AlertDialog(
          title: Text(
            'Você tem certeza de remover a(o) ${nameProduct} do carrinho?',
            style: AppTextStyle.texSpanBlack,
          ),
          icon: const Icon(
            Icons.shopping_basket_outlined,
            color: AppColors.black,
            size: 100,
          ),
          actions: [
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: AppElevatedButton(
                    type: ButtonType.filled,
                    textButton: 'Sim',
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                  ),
                ),
                Expanded(
                  child: AppElevatedButton(
                    type: ButtonType.filled,
                    textButton: 'Não',
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
