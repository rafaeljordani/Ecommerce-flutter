class Utils {
  String email = '';

  static String? validaeEmail(String? value) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    bool isEmailValid = emailRegex.hasMatch(value!.trim());

    if (isEmailValid) {
      return null;
    }
    return 'Email inválido';
  }

  static String? validateSenha(String? value) {
    int caracterMinimo = 6;
    RegExp senhaCaracterExpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    RegExp senhaCaracterMauscula = RegExp(r'[A-Z]');
    RegExp senhaCaracterMinuscula = RegExp(r'[a-z]');

    bool isSenhaEspecial = value!.contains(senhaCaracterExpecial);
    bool isSenhaCaracterMaiuscula = value.contains(senhaCaracterMauscula);
    bool isSenhaCaracterMinuscula = value.contains(senhaCaracterMinuscula);
    bool isSenhaCaracterMinimo = value.trim().length > caracterMinimo;

    bool isSenhaValida =
        isSenhaCaracterMaiuscula &&
        isSenhaCaracterMinimo &&
        isSenhaCaracterMinuscula &&
        isSenhaEspecial;

    if (isSenhaValida) {
      return null;
    }
    return 'Senha invalida';
  }

  static String? validateNome(String? value) {
    RegExp nameRegex = RegExp(
      r"^[A-Za-zÀ-ÖØ-öø-ÿ]+(?:[ '-][A-Za-zÀ-ÖØ-öø-ÿ]+)*$",
    );

    bool isNomeValido = nameRegex.hasMatch(value!.trim());

    if (isNomeValido) {
      return null;
    }
    return 'Nome invalido';
  }
}
