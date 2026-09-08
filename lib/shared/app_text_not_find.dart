import 'package:ecommerce/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextNotFind extends StatelessWidget {
  const AppTextNotFind({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 200),
        Text('Não há produtos com este nome', style: AppTextStyle.subTitle),
      ],
    );
  }
}
