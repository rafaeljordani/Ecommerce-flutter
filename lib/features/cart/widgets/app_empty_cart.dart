import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';

class AppEmptyCart extends StatelessWidget {
  const AppEmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Expanded(child: Icon(Icons.shopping_cart_outlined, size: 200)),
          Expanded(
            child: Text('Seu carrinho esta vazil', style: AppTextStyle.title),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppElevatedButton(
              type: ButtonType.filled,
              textButton: 'Voltar para home',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
