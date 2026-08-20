import 'package:flutter/material.dart';

class LoginController {
  bool isActiveButton = false;
  bool isActiveChecked = false;
  bool isLoding = false;

  TextEditingController emailControler = TextEditingController();
  TextEditingController senhaControler = TextEditingController();

  void changeActiveBox() {
    isActiveChecked = !isActiveChecked;
  }

  Future<void> login() async {
    //simula o delayed de uma chamada de API
    await Future.delayed(const Duration(seconds: 2));
  }
}
