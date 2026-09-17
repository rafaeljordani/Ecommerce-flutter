import 'package:ecommerce/features/cart/controllers/cartcontroller.dart';
import 'package:ecommerce/features/cart/widgets/app_empty_cart.dart';
import 'package:ecommerce/features/cart/widgets/app_total_checkout_setion.dart';
import 'package:ecommerce/features/cart/widgets/cart_product_card.dart';
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
                            return CartProductCard(
                              decrement: () {
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
                              isnot: () => controller.removeProducFromList(
                                controller.productsCard[index],
                              ),
                            );
                          },
                        ),
                      ),
                      AppTotalCheckoutSetion(
                        cartPrice: controller.totalPriceCart,
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
