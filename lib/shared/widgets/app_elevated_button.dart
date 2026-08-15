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
    this.isLoad = false,
  });

  final ButtonType type;
  final String textButton;
  final VoidCallback? onPressed;
  final bool isLoad;

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
      child: isLoad
          ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(color: AppColors.white),
              ),
            )
          : Text(textButton),
    );
  }
}
