import 'package:ecommerce/features/cart/models/product_cart_model.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/utils.dart';
import 'package:flutter/material.dart';

class AppProductLine extends StatelessWidget {
  const AppProductLine({super.key, required this.productCart});

  final ProductCart productCart;

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${productCart.quantity.toString()}x ${productCart.name}',
            style: AppTextStyle.textBold,
          ),
          Text(
            utils.formatCurrency(productCart.subtotal!),
            style: AppTextStyle.textPasswordValionCheackGrey,
          ),
        ],
      ),
    );
  }
}
