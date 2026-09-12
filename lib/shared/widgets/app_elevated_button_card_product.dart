import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class AppElevatedButtonCardProduct extends StatelessWidget {
  const AppElevatedButtonCardProduct({
    super.key,
    required this.text,
    required this.incrementOrDecrement,
  });

  final String text;
  final VoidCallback? incrementOrDecrement;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        minimumSize: Size(70, 50),
        textStyle: AppTextStyle.buttonLabel,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: incrementOrDecrement,
      child: Text(text),
    );
  }
}
