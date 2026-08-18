import 'package:ecommerce/shared/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle title = const TextStyle(
    color: AppColors.black,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static TextStyle buttonLabel = const TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle recuSenha = const TextStyle(color: AppColors.black);

  static TextStyle subTitle = const TextStyle(
    color: AppColors.black,
    fontSize: 16,
  );

  static TextStyle titleFirstPage = const TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle texSpanBlack = const TextStyle(
    color: AppColors.black,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  static TextStyle texSpanGrey = const TextStyle(
    color: AppColors.grey,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textPasswordValionCheackGrey = const TextStyle(
    color: AppColors.grey,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textPasswordValionCheackGreen = const TextStyle(
    color: AppColors.green,
    fontWeight: FontWeight.bold,
  );
}
