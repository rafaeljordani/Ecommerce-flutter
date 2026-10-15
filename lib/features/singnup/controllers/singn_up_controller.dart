import 'package:ecommerce/features/singnup/services/signup_services.dart';
import 'package:ecommerce/shared/ecom_http_client.dart';
import 'package:flutter/material.dart';

class SignupException implements Exception {
  SignupException(this.message);

  final String message;

  @override
  String toString() => message;
}

class SingnUpController extends ChangeNotifier {
  bool isActiveChecked = false;
  bool? checkBoxErrorValue;

  String senha = '';
  String confirmarSenha = '';
  bool isLoding = false;

  final int _caracterMinimo = 6;
  final RegExp _senhaCaracterExpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
  final RegExp _senhaCaracterMauscula = RegExp(r'[A-Z]');
  final RegExp _senhaCaracterMinuscula = RegExp(r'[a-z]');

  bool get isSenhaEspecial => senha.contains(_senhaCaracterExpecial);
  bool get isSenhaCaracterMaiuscula => senha.contains(_senhaCaracterMauscula);
  bool get isSenhaCaracterMinuscula => senha.contains(_senhaCaracterMinuscula);
  bool get isSenhaCaracterMinimo => senha.trim().length > _caracterMinimo;

  TextEditingController emailControler = TextEditingController();
  TextEditingController nomeControler = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  final SignupService signupService = SignupService();

  bool get isConfirmarSenhaValida {
    if (confirmarSenha.isEmpty) {
      return false;
    } else if (confirmarSenha == senha) {
      return true;
    }
    return false;
  }

  bool get senhaValida {
    if ((isSenhaEspecial) &&
        (isSenhaCaracterMaiuscula) &&
        (isSenhaCaracterMinimo) &&
        (isSenhaCaracterMinuscula)) {
      return true;
    }
    return false;
  }

  void changeActiveCheckBox() {
    isActiveChecked = !isActiveChecked;
    if (isActiveChecked) checkBoxErrorValue = null;
    notifyListeners();
  }

  void setSenha(String senhaParam) {
    senha = senhaParam;
    notifyListeners();
  }

  void setConfirmaSenha(String confirmarSenhaParam) {
    confirmarSenha = confirmarSenhaParam;
    notifyListeners();
  }

  void clearSignupFields() {
    key.currentState?.reset();
    emailControler.clear();
    nomeControler.clear();
    senha = '';
    confirmarSenha = '';
    isActiveChecked = false;
    checkBoxErrorValue = null;
    notifyListeners();
  }

  Future<void> loginDelay() async {
    //simula o delayed de uma chamada de API
    await Future.delayed(const Duration(seconds: 2));
  }

  String? validadeSenha(String? value) {
    if (!senhaValida) {
      return 'falta algum requisito';
    }
    return null;
  }

  String? validadeConfirmaSenha(String? value) {
    if (!isConfirmarSenhaValida) {
      return 'Senha não coincidem';
    }
    return null;
  }

  Future<bool> hadleSignUp() async {
    final formIsValid = key.currentState?.validate() ?? false;
    final requiredDataIsValid =
        emailControler.text.trim().isNotEmpty &&
        nomeControler.text.trim().isNotEmpty &&
        senhaValida &&
        isConfirmarSenhaValida;
    if (!isActiveChecked) {
      checkBoxErrorValue = true;
    }

    if (!formIsValid || !requiredDataIsValid || !isActiveChecked) {
      notifyListeners();
      return false;
    }

    isLoding = true;
    notifyListeners();
    try {
      await signupService.registerUser(
        nomeControler.text,
        emailControler.text,
        senha,
        confirmarSenha,
        isActiveChecked,
      );
      return true;
    } on EcomHttpException catch (e) {
      throw SignupException(
        (e.data is Map ? e.data['message']?.toString() : null) ??
            e.message ??
            'Erro desconhecido',
      );
    } finally {
      isLoding = false;
      notifyListeners();
    }
  }
}
