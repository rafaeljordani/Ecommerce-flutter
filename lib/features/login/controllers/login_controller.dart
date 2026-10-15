import 'package:ecommerce/features/login/model/auth_user.dart';
import 'package:ecommerce/features/login/services/login_services.dart';
import 'package:ecommerce/shared/ecom_http_client.dart';
import 'package:ecommerce/shared/exceptions/auth_excepetion.dart';
import 'package:ecommerce/utils.dart';
import 'package:flutter/material.dart';

class LoginException implements Exception {
  LoginException(this.message);

  final String message;

  @override
  String toString() => message;
}

class LoginController extends ChangeNotifier {
  bool isActiveButton = false;
  bool isActiveChecked = false;
  bool isLoding = false;

  // User? user;
  AuthUser? authUser;

  TextEditingController emailControler = TextEditingController();
  TextEditingController senhaControler = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  final LoginServices loginService = LoginServices();

  Utils utils = Utils();

  void changeActiveBox() {
    isActiveChecked = !isActiveChecked;
    notifyListeners();
  }

  void changeIsLoading(bool value) {
    isLoding = value;
    notifyListeners();
  }

  Future<bool> handleLogin() async {
    if (!key.currentState!.validate()) {
      throw ErrorDescription('validacao_incorreta');
    }
    changeIsLoading(true);
    try {
      authUser = await loginService.loginUser(
        emailControler.text,
        senhaControler.text,
      );
      return true;
    } on EcomHttpException catch (e) {
      throw LoginException(
        (e.data is Map ? e.data['message']?.toString() : null) ??
            e.message ??
            'Erro desconhecido',
      );
    } finally {
      changeIsLoading(false);
    }
  }
}
