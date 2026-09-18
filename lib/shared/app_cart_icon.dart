import 'package:ecommerce/features/cart/controllers/cart_controller.dart';
import 'package:ecommerce/features/cart/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppCartIcon extends StatelessWidget {
  const AppCartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, CartPage.route);
          },
          icon: const Icon(Icons.shopping_cart_outlined, size: 28),
        ),
        Consumer<CartController>(
          builder: (context, cartController, child) {
            // bool visibilty = cartController.visibilityStack();
            return Visibility(
              visible: cartController.productsCard.isNotEmpty,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('${cartController.productsCard.length}'),
              ),
            );
          },
        ),
      ],
    );
  }
}
