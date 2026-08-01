import 'package:ecommerce/pages/signup_page.dart';
import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Safeare desconta espaços do dispositivo ex:barra superior
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(flex: 1),
              Text('+DevsEcomm', style: AppTextStyle.title),
              const Spacer(flex: 2),
              const AppTextField(hintText: 'email@dominio.com'),
              const SizedBox(height: 20),
              const AppTextField(hintText: '************'),
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
                onPressed: () => {},
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
    );
  }
}
