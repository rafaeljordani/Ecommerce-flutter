import 'package:ecommerce/features/login/model/user.dart';
import 'package:ecommerce/shared/exceptions/auth_excepetion.dart';
import 'package:ecommerce/utils.dart';
import 'package:flutter/material.dart';

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

  void changeIsLoading(bool value) {
    isLoding = value;
    notifyListeners();
  }

  Future<void> handleLogin() async {
    if (!key.currentState!.validate()) {
      throw ErrorDescription('validacao_incorreta');
    }
    changeIsLoading(true);
    try {
      await login();
      emailControler.clear();
      senhaControler.clear();
    } finally {
      changeIsLoading(false);
    }
  }

  Future<void> login() async {
    //simula o delayed de uma chamada de API
    await Future.delayed(const Duration(seconds: 2));
    if (emailControler.text.trim() != 'rafael@gmail.com' ||
        senhaControler.text.trim() != 'Fa101084@') {
      throw AuthExcepetion('E-mail ou senha incorretos');
    }
    user = User(name: 'nome', email: emailControler.text);
  }
}
