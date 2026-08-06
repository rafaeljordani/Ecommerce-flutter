import 'package:flutter/material.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox(this.isActiveCheackBox, {super.key});

  final bool isActiveCheackBox;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isActiveCheackBox,
      onChanged: (value) {
        isActiveCheackBox = value!;
      },
    );
  }
}
