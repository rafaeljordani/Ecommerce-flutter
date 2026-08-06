import 'package:ecommerce/shared/app_colors.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_check_box.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static String route = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isActiveButton = false;
  String email = '';
  String nome = '';
  String senha = '';
  String confirmarSenha = '';
  bool isActiveChecked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isActiveButton =
        email.trim().isNotEmpty &&
        nome.trim().isNotEmpty &&
        senha.trim().isNotEmpty &&
        confirmarSenha.trim().isNotEmpty &&
        isActiveChecked == true;

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
              Align(child: Text('Criar uma conta', style: AppTextStyle.title)),
              Align(
                child: Text(
                  'Insira seus dados para iniciar suas compras',
                  style: AppTextStyle.subTitle,
                ),
              ),
              AppTextField(
                hintText: 'email@dominio.com',
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              AppTextField(
                hintText: 'nome',
                onChanged: (value) {
                  setState(() {
                    nome = value;
                  });
                },
              ),
              AppTextField(
                hintText: 'senha',
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    senha = value;
                  });
                },
              ),
              AppTextField(
                hintText: 'confirmar senha ',
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    confirmarSenha = value;
                  });
                },
              ),
              const Spacer(flex: 2),

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
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'Ao clicar em continuar, você concorda com os nossos \n',
                          style: AppTextStyle.texSpanGrey,
                        ),
                        TextSpan(
                          text: 'Termos de Serviço',
                          style: AppTextStyle.texSpanBlack,
                        ),
                        TextSpan(
                          text: 'e com a ',
                          style: AppTextStyle.texSpanGrey,
                        ),
                        TextSpan(
                          text: 'Política de Privacidade',
                          style: AppTextStyle.texSpanBlack,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AppElevatedButton(
                type: ButtonType.filled,
                textButton: 'Continuar ',
                onPressed: isActiveButton
                    ? () {
                        print('cliquei em continuar');
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
