class LoginController {
  String email = '';
  String senha = '';
  bool isActiveButton = false;
  bool isActiveChecked = false;

  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final int caracterMinimo = 6;

  bool get isEmailValid => _emailRegex.hasMatch(email.trim());

  bool get isSenhaValida => senha.trim().length > caracterMinimo;

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

  void setSenha(String senhaParan) {
    senha = senhaParan;
    changeActiveButton();
  }

  void setEmail(String emailParan) {
    email = emailParan;
    changeActiveButton();
  }

  void changeActiveButton() {
    isActiveButton = isEmailValid && isSenhaValida;
  }

  void changeActiveCheckBox() {
    isActiveChecked = !isActiveChecked;
  }
}
