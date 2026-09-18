import 'package:ecommerce/features/cart/pages/Checkout_page.dart';
import 'package:ecommerce/features/cart/widgets/app_setion_button_finished.dart';
import 'package:ecommerce/features/cart/widgets/app_total_cart.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';

class AppTotalCartSetion extends StatelessWidget {
  const AppTotalCartSetion({super.key, required this.cartPrice});

  final double cartPrice;

  @override
  Widget build(BuildContext context) {
    return AppSetionButtonFinished(
      column: Column(
        spacing: 20,
        children: [
          AppTotalCart(cartPrice: cartPrice),
          AppElevatedButton(
            type: ButtonType.filled,
            textButton: 'Continuar',
            onPressed: () {
              Navigator.pushNamed(context, CheckoutPage.route);
            },
          ),
        ],
      ),
    );
  }
}
