import 'package:ecommerce/features/cart/controllers/cart_controller.dart';

import 'package:ecommerce/features/cart/widgets/app_product_line.dart';
import 'package:ecommerce/features/cart/widgets/app_setion_button_finished.dart';
import 'package:ecommerce/features/cart/widgets/app_total_cart.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  static String route = '/checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finalizar pedido', style: AppTextStyle.title),
      ),
      body: SafeArea(
        child: Consumer<CartController>(
          builder: (context, controller, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: AppTotalCart(cartPrice: controller.totalPriceCart),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.productsCard.length,
                    itemBuilder: (context, index) {
                      return AppProductLine(
                        productCart: controller.productsCard[index],
                      );
                    },
                  ),
                ),
                AppSetionButtonFinished(
                  column: Column(
                    children: [
                      AppElevatedButton(
                        type: ButtonType.filled,
                        textButton: 'Confirmar pedido',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
