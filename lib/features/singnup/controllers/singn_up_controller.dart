class SingnUpController {
  bool isActiveChecked = false;
  bool isActiveButton = false;
  String email = '';
  String nome = '';
  String senha = '';
  String confirmarSenha = '';

  void changeActiveCheckBox() {
    isActiveChecked = !isActiveChecked;
  }

  void changeActiveButton() {
    isActiveButton =
        email.trim().isNotEmpty &&
        nome.trim().isNotEmpty &&
        senha.trim().isNotEmpty &&
        confirmarSenha.trim().isNotEmpty &&
        isActiveChecked == true;
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
