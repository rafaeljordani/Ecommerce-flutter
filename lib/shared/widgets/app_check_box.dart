import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  const AppCheckbox(this.isActiveChecked, {super.key, this.onChanged});

  final bool isActiveChecked;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(value: isActiveChecked, onChanged: onChanged);
  }
}
