import 'package:ecommerce/features/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        leading: Consumer<LoginController>(
          builder: (context, loginController, child) {
            return Text(loginController.user!.name);
          },
        ),
      ),
      body: Container(),
    );
  }
}
