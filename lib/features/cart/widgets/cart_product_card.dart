import 'package:ecommerce/features/cart/models/product_cart_model.dart';
import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_stepper_card.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/utils.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
    required this.product,
    required this.increment,
    required this.decrement,
  });

  final ProductCart product;
  final VoidCallback increment;
  final VoidCallback decrement;

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 24),
      child: Container(
        height: 140,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            spacing: 15,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(product.imageUrl.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.name, style: AppTextStyle.textModel),
                              Text(
                                product.brand,
                                style: AppTextStyle.texSpanGrey,
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Text(
                            utils.formatCurrency(product.subtotal!),
                            style: AppTextStyle.textPriceCartWidgt,
                          ),
                        ),
                      ],
                    ),
                    AppStepperCard(
                      decrement: '-',
                      getDecrement: () async {
                        decrement();
                      },
                      icrement: '+',
                      getIncrement: () {
                        increment();
                      },
                      quantity: product.quantity,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
