import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  static void success(BuildContext context, String message) {
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.success,
      snackBarStrategy: RemoveSnackBarStrategy(),
    ).show(context);
  }

  static void error(BuildContext context, String message) {
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.error,
      snackBarStrategy: RemoveSnackBarStrategy(),
    ).show(context);
  }

  static void info(BuildContext context, String message) {
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.info,
      snackBarStrategy: RemoveSnackBarStrategy(),
    ).show(context);
  }
}
