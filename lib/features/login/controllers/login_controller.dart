class LoginController {
  String email = '';
  String senha = '';
  bool isActiveButton = false;
  bool isActiveChecked = false;
  bool isLoding = false;

  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final int caracterMinimo = 6;
  final RegExp _senhaCaracterExpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
  final RegExp _senhaCaracterMauscula = RegExp(r'[A-Z]');
  final RegExp _senhaCaracterMinuscula = RegExp(r'[a-z]');

  bool get isEmailValid => _emailRegex.hasMatch(email.trim());
  bool get isSenhaValida =>
      isSenhaCaracterMaiuscula &&
      isSenhaCaracterMinimo &&
      isSenhaCaracterMinuscula &&
      isSenhaEspecial;
  bool get isSenhaEspecial => senha.contains(_senhaCaracterExpecial);
  bool get isSenhaCaracterMaiuscula => senha.contains(_senhaCaracterMauscula);
  bool get isSenhaCaracterMinuscula => senha.contains(_senhaCaracterMinuscula);
  bool get isSenhaCaracterMinimo => senha.trim().length > caracterMinimo;

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

  Future<void> login() async {
    //simula o delayed de uma chamada de API
    await Future.delayed(const Duration(seconds: 2));
  }
}
