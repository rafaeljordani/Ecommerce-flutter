import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button_card_product.dart';
import 'package:flutter/material.dart';

class AppStepperCard extends StatelessWidget {
  const AppStepperCard({
    super.key,
    required this.icrement,
    required this.decrement,
    required this.quantity,
    required this.getIncrement,
    required this.getDecrement,
  });

  final String icrement;
  final String decrement;
  final int quantity;
  final VoidCallback? getIncrement;
  final VoidCallback? getDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppElevatedButtonCardProduct(
          text: decrement,
          incrementOrDecrement: getDecrement,
        ),
        Text(quantity.toString(), style: AppTextStyle.title),
        AppElevatedButtonCardProduct(
          text: icrement,
          incrementOrDecrement: getIncrement,
        ),
      ],
    );
  }
}
