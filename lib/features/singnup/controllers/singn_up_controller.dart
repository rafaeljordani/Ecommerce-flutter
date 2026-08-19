class SingnUpController {
  bool isActiveChecked = false;
  bool isActiveButton = false;
  String email = '';
  String nome = '';
  String senha = '';
  String confirmarSenha = '';
  bool isLoding = false;

  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final int caracterMinimo = 6;
  final RegExp _nameRegex = RegExp(
    r"^[A-Za-zÀ-ÖØ-öø-ÿ]+(?:[ '-][A-Za-zÀ-ÖØ-öø-ÿ]+)*$",
  );
  final RegExp _senhaCaracterExpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
  final RegExp _senhaCaracterMauscula = RegExp(r'[A-Z]');
  final RegExp _senhaCaracterMinuscula = RegExp(r'[a-z]');

  bool get isEmailValid => _emailRegex.hasMatch(email.trim());
  bool get isSenhaEspecial => senha.contains(_senhaCaracterExpecial);
  bool get isSenhaCaracterMaiuscula => senha.contains(_senhaCaracterMauscula);
  bool get isSenhaCaracterMinuscula => senha.contains(_senhaCaracterMinuscula);
  bool get isSenhaCaracterMinimo => senha.trim().length > caracterMinimo;
  bool get isNomeValido => _nameRegex.hasMatch(nome.trim());

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
        (isSenhaCaracterMinuscula) &&
        (isConfirmarSenhaValida)) {
      return true;
    }
    return false;
  }

  void changeActiveCheckBox() {
    isActiveChecked = !isActiveChecked;
  }

  void setEmail(String emailParam) {
    email = emailParam;
  }

  void setNome(String nomeParam) {
    nome = nomeParam;
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

  String? validaeEmail(String? value) {
    if (isEmailValid) {
      return null;
    }
    return 'Email inválido';
  }

  String? validateNome(String? value) {
    if (isNomeValido) {
      return null;
    }
    return 'Senha invalida';
  }
}
