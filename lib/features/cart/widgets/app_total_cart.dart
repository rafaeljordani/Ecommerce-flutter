import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/utils.dart';
import 'package:flutter/material.dart';

class AppTotalCart extends StatelessWidget {
  const AppTotalCart({super.key, required this.cartPrice});

  final double cartPrice;

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();

    const String tag = 'AnimCartTotal';

    return Hero(
      tag: tag,
      child: Material(
        child: Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total do pedido',
                  style: AppTextStyle.textPasswordValionCheackGrey,
                ),
                Text(
                  utils.formatCurrency(cartPrice),
                  style: AppTextStyle.textPriceModal,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
