import 'package:flutter/material.dart';

class SingnUpController {
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

  // FORMA DIFERETE DE FAZER
  // List<Map<String, bool>> getPasswordRequirements() {
  //   return [
  //     {'Mínimo de 6 caracteres': isSenhaCaracterMinimo},
  //     {'No mínimo um caracter especial': isSenhaEspecial},
  //     {'No mínimo uma letra maiúscula': isSenhaCaracterMaiuscula},
  //     {'No mínimo uma letra minúscula': isSenhaCaracterMinuscula},
  //     {'As senhas coincidem': isConfirmarSenhaValida},
  //   ];
  // }

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
  }

  void setSenha(String senhaParam) {
    senha = senhaParam;
  }

  void setConfirmaSenha(String confirmarSenhaParam) {
    confirmarSenha = confirmarSenhaParam;
  }

  Future<void> login() async {
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

  bool snacBarCheack() {
    if (!isActiveChecked) {
      return true;
    }
    return false;
  }
}
