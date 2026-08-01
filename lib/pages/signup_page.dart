import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  static String route = '/signup';

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)!.settings.arguments);
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Container(),
    );
  }
}
