import 'package:ecommerce/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}

class LoginController extends ChangeNotifier {
  bool isActiveButton = false;
  bool isActiveChecked = false;
  bool isLoding = false;

  User? user;

  TextEditingController emailControler = TextEditingController();
  TextEditingController senhaControler = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  Utils utils = Utils();

  void changeActiveBox() {
    isActiveChecked = !isActiveChecked;
    notifyListeners();
  }

  Future<void> handleLogin() async {
    if (key.currentState!.validate()) {
      isLoding = true;
      notifyListeners();

      await login();
      isLoding = false;
      notifyListeners();
      emailControler.clear();
      senhaControler.clear();
      return;
    }
    throw ErrorDescription('validacao_incorreta');
  }

  Future<void> login() async {
    //simula o delayed de uma chamada de API
    await Future.delayed(const Duration(seconds: 2));
    user = User(name: 'nome', email: emailControler.text);
  }
}
