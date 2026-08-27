import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextFieldExtends extends StatelessWidget {
  const AppTextFieldExtends({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: AppTextStyle.titleFirstPage),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            color: AppColors.grey100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Padding(
            padding: EdgeInsets.all(6.0),
            child: Icon(Icons.arrow_forward_ios, size: 14),
          ),
        ),
      ],
    );
  }
}
