import 'package:ecommerce/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.color,
    required this.textColor,
    required this.textButton,
  });

  final Color color;
  final Color textColor;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        textStyle: AppTextStyle.buttonLabel,
        minimumSize: const Size.fromHeight(48),
        foregroundColor: textColor,
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      ),
      child: Text(textButton),
    );
  }
}
