import 'package:ecommerce/utils.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  bool isActiveButton = false;
  bool isActiveChecked = false;
  bool isLoding = false;

  TextEditingController emailControler = TextEditingController();
  TextEditingController senhaControler = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  Utils utils = Utils();

  void changeActiveBox() {
    isActiveChecked = !isActiveChecked;
    notifyListeners();
  }

  Future<void> login() async {
    if (key.currentState!.validate()) {
      isLoding = true;

      notifyListeners();

      await loginDelay();
      isLoding = false;
      notifyListeners();
    }
  }

  Future<void> loginDelay() async {
    //simula o delayed de uma chamada de API
    await Future.delayed(const Duration(seconds: 2));
  }
}
