import 'package:ecommerce/pages/signup_page.dart';
import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_check_box.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String route = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String senha = '';
  bool isActiveButton = false;
  bool isActiveChecked = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isActiveButton = email.trim().isNotEmpty && senha.trim().isNotEmpty;
    return Scaffold(
      //Safeare desconta espaços do dispositivo ex:barra superior
      body: SafeArea(
        child: SingleChildScrollView(
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
                    hintText: 'email@dominio.com',
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    hintText: '************',
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        senha = value;
                      });
                    },
                  ),
                  Row(
                    children: [
                      AppCheckbox(
                        isActiveChecked,
                        onChanged: (value) {
                          setState(() {
                            isActiveChecked = !isActiveChecked;
                          });
                        },
                      ),
                      const Text('Lembrar-me'),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Esqueci minha senha',
                        style: AppTextStyle.recuSenha,
                      ),
                    ),
                  ),
                  AppElevatedButton(
                    type: ButtonType.filled,
                    onPressed: isActiveButton
                        ? () {
                            print('Cliquei em entrar');
                          }
                        : null,
                    textButton: 'Entrar',
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
    );
  }
}
