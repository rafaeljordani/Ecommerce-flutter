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
    if (isEmailValid) {
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
