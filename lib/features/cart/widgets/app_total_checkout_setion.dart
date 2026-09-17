import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/utils.dart';
import 'package:flutter/material.dart';

class AppTotalCheckoutSetion extends StatelessWidget {
  const AppTotalCheckoutSetion({super.key, required this.cartPrice});

  final double cartPrice;

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(width: 1, color: AppColors.black)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                utils.formatCurrency(cartPrice),
                style: AppTextStyle.textPriceModal,
              ),
            ),
            Expanded(
              child: AppElevatedButton(
                type: ButtonType.filled,
                textButton: 'Comprar',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
