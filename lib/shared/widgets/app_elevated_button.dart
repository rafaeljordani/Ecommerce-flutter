import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:flutter/material.dart';

enum ButtonType { filled, outlined }

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.type,
    required this.textButton,
    this.onPressed,
  });

  final ButtonType type;
  final String textButton;
  final VoidCallback? onPressed;

  ButtonStyle _getButtonStyle() {
    switch (type) {
      case ButtonType.filled:
        return ElevatedButton.styleFrom(
          textStyle: AppTextStyle.buttonLabel,
          minimumSize: const Size.fromHeight(48),
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
        );

      case ButtonType.outlined:
        return ElevatedButton.styleFrom(
          textStyle: AppTextStyle.buttonLabel,
          minimumSize: const Size.fromHeight(48),
          foregroundColor: AppColors.black,
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
            side: const BorderSide(color: AppColors.black),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: _getButtonStyle(),
      child: Text(textButton),
    );
  }
}
