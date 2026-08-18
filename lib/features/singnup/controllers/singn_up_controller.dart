class SingnUpController {
  bool isActiveChecked = false;
  bool isActiveButton = false;
  String email = '';
  String nome = '';
  String senha = '';
  String confirmarSenha = '';

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

  String? get emailError {
    if (email.trim().isEmpty || isEmailValid) {
      return null;
    }
    return 'Email invalido';
  }

  String? get nomeError {
    if ((nome.trim().isEmpty) || (isNomeValido)) {
      return null;
    }
    return 'Nome invalido';
  }

  void changeActiveCheckBox() {
    isActiveChecked = !isActiveChecked;
    changeActiveButton();
  }

  void changeActiveButton() {
    isActiveButton =
        isEmailValid && isNomeValido && senhaValida && isActiveChecked;
  }

  void setEmail(String emailParam) {
    email = emailParam;
    changeActiveButton();
  }

  void setNome(String nomeParam) {
    nome = nomeParam;
    changeActiveButton();
  }

  void setSenha(String senhaParam) {
    senha = senhaParam;
    changeActiveButton();
  }

  void setConfirmaSenha(String confirmarSenhaParam) {
    confirmarSenha = confirmarSenhaParam;
    changeActiveButton();
  }
}
