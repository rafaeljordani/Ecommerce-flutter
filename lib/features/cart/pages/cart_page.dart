import 'package:ecommerce/features/cart/controllers/cart_controller.dart';
import 'package:ecommerce/features/cart/models/product_cart_model.dart';
import 'package:ecommerce/features/cart/widgets/app_empty_cart.dart';
import 'package:ecommerce/features/cart/widgets/app_total_cart_setion.dart';
import 'package:ecommerce/features/cart/widgets/cart_product_card.dart';
import 'package:ecommerce/shared/app_dialog_remove_product.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static String route = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carrinho', style: AppTextStyle.title)),
      body: SafeArea(
        child: Consumer<CartController>(
          builder: (context, controller, child) {
            return controller.productsCard.isEmpty
                ? const AppEmptyCart()
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.productsCard.length,
                          itemBuilder: (context, index) {
                            ProductCart productCart =
                                controller.productsCard[index];
                            return CartProductCard(
                              decrement: () async {
                                if (productCart.quantity == 1) {
                                  final removeOrNot = await showDialog<bool>(
                                    context: context,
                                    builder: (_) => AppDialogRemoveProduct(
                                      nameProduct: productCart.name,
                                    ),
                                  );
                                  if (removeOrNot!) {
                                    controller.removeProducFromList(
                                      controller.productsCard[index],
                                    );
                                  }
                                  return;
                                }
                                controller.decrement(
                                  controller.productsCard[index],
                                );
                              },
                              increment: () {
                                controller.incrementProduct(
                                  controller.productsCard[index],
                                );
                              },
                              product: controller.productsCard[index],
                            );
                          },
                        ),
                      ),
                      AppTotalCartSetion(cartPrice: controller.totalPriceCart),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
