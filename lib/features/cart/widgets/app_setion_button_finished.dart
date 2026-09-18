import 'package:ecommerce/shared/app_colors.dart';
import 'package:flutter/material.dart';

class AppSetionButtonFinished extends StatelessWidget {
  const AppSetionButtonFinished({super.key, required this.column});

  final Column column;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(width: 1, color: AppColors.black)),
      ),
      child: Padding(padding: const EdgeInsets.all(24.0), child: column),
    );
  }
}
