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

  bool get isEmailValid => _emailRegex.hasMatch(email.trim());
  bool get isSenhaValida => senha.trim().length > caracterMinimo;
  bool get isNomeValido => _nameRegex.hasMatch(nome.trim());
  bool get isConfirmarSenhaValida =>
      confirmarSenha.trim().length > caracterMinimo;

  String? get emailError {
    if ((email.trim().isEmpty) || (isEmailValid)) {
      return null;
    }
    return 'Email inválido';
  }

  String? get senhaError {
    if ((senha.trim().isEmpty) || (isSenhaValida)) {
      return null;
    }
    return 'Senha invalida';
  }

  String? get confirmarSenhaError {
    if ((confirmarSenha.trim().isEmpty) || (isConfirmarSenhaValida)) {
      return null;
    }
    return 'Senha invalida';
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
        isEmailValid &&
        isNomeValido &&
        isSenhaValida &&
        isConfirmarSenhaValida &&
        isActiveChecked;
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
