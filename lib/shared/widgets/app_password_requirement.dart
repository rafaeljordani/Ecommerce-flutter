import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class AppPasswordRequirement extends StatelessWidget {
  const AppPasswordRequirement({
    super.key,
    required this.text,
    required this.isValid,
  });

  final String text;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 5,
      children: [
        Icon(
          Icons.check_circle,
          color: isValid ? AppColors.green : AppColors.grey,
        ),
        Text(
          text,
          style: isValid
              ? AppTextStyle.textPasswordValionCheackGreen
              : AppTextStyle.textPasswordValionCheackGrey,
        ),
      ],
    );
  }
}
