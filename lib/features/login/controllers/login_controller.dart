class LoginController {
  String email = '';
  String senha = '';
  bool isActiveButton = false;
  bool isActiveChecked = false;

  void setSenha(String senhaParan) {
    senha = senhaParan;
    changeActiveButton();
  }

  void setEmail(String emailParan) {
    email = emailParan;
    changeActiveButton();
  }

  void changeActiveButton() {
    isActiveButton = email.trim().isNotEmpty && senha.trim().isNotEmpty;
  }

  void changeActiveCheckBox() {
    isActiveChecked = !isActiveChecked;
  }
}
