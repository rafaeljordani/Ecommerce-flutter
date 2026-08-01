import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  static String route = '/signup';

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)!.settings.arguments);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Criar uma conta'),
              const Text('Insira seus dados para iniciar suas compras'),
              const AppTextField(hintText: 'email@dominio.com'),
              const AppTextField(hintText: 'nome'),
              const AppTextField(hintText: 'senha'),
              const AppTextField(hintText: 'confirmar senha '),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Ao clicar em continuar, você concorda com os nossos \n',
                      style: TextStyle(color: AppColors.grey100),
                    ),
                    TextSpan(
                      text: 'Termos de Serviço',
                      style: TextStyle(color: AppColors.black),
                    ),
                    TextSpan(
                      text: 'e com',
                      style: TextStyle(color: AppColors.grey100),
                    ),
                    TextSpan(
                      text: 'Política de Privacidade',
                      style: TextStyle(color: AppColors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
