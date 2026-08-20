import 'package:ecommerce/features/login/controllers/login_controller.dart';
import 'package:ecommerce/features/recover/pages/recover_page.dart';
import 'package:ecommerce/features/singnup/pages/signup_page.dart';
import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_check_box.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/shared/widgets/app_text_field.dart';
import 'package:ecommerce/utils.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String route = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = LoginController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  Utils utils = Utils();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _login() async {
    if (key.currentState!.validate()) {
      setState(() {
        loginController.isLoding = true;
      });
    }
    await loginController.login();
    setState(() {
      loginController.isLoding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Safeare desconta espaços do dispositivo ex:barra superior
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: SizedBox(
              height:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(flex: 1),
                    SizedBox(
                      height: 150,
                      child: Image.asset('assets/images/splash_screen.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '+DevsEcomm',
                          style: AppTextStyle.titleFirstPage,
                        ),
                      ),
                    ),
                    const Spacer(flex: 2),
                    AppTextField(
                      controller: loginController.emailControler,
                      validator: (value) {
                        return utils.validaeEmail(
                          loginController.emailControler.text,
                        );
                      },
                      hintText: 'email@dominio.com',
                    ),
                    const SizedBox(height: 20),
                    AppTextField(
                      validator: (value) {
                        return utils.validateSenha(
                          loginController.senhaControler.text,
                        );
                      },
                      hintText: '************',
                      obscureText: true,
                      controller: loginController.senhaControler,
                    ),
                    Row(
                      children: [
                        AppCheckbox(
                          loginController.isActiveChecked,
                          onChanged: (value) {
                            setState(() {
                              loginController.changeActiveBox();
                            });
                          },
                        ),
                        const Text('Lembrar-me'),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RecoverPage.route);
                        },
                        child: Text(
                          'Esqueci minha senha',
                          style: AppTextStyle.recuSenha,
                        ),
                      ),
                    ),
                    AppElevatedButton(
                      type: ButtonType.filled,
                      onPressed: () {
                        _login();
                      },
                      textButton: 'Entrar',
                      isLoad: loginController.isLoding,
                    ),
                    const SizedBox(height: 25),
                    AppElevatedButton(
                      type: ButtonType.outlined,
                      onPressed: () => {
                        Navigator.pushNamed(
                          context,
                          SignupPage.route,
                          arguments: 'Vim da primeira tela',
                        ),
                      },
                      textButton: 'Cadastrar-se',
                    ),
                    const Spacer(flex: 2),
                    //gestureDetector adiciona metodos de intecao com usuario ex: onTap
                    GestureDetector(
                      onTap: () {
                        print('cliquei');
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Termos de serviço',
                              style: TextStyle(color: AppColors.black),
                            ),
                            TextSpan(
                              text: 'e',
                              style: TextStyle(color: AppColors.grey),
                            ),
                            TextSpan(
                              text: 'Politicas de Privacidade',
                              style: TextStyle(color: AppColors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
