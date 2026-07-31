import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              Text('+DevsEcomm', style: AppTextStyle.title),
              const Spacer(flex: 2),
              const AppTextField(hintText: 'email@dominio.com'),
              const AppTextField(hintText: '************'),
              TextButton(
                onPressed: () {},
                child: const Text('Esqueci minha senha'),
              ),
              const AppElevatedButton(
                color: AppColors.black,
                textColor: AppColors.white,
                textButton: 'Entrar',
              ),
              const AppElevatedButton(
                color: AppColors.white,
                textColor: AppColors.black,
                textButton: 'Cadastrar',
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
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'e',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: 'Politicas de Privacidade',
                        style: TextStyle(color: Colors.black),
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
