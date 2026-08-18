import 'package:ecommerce/features/singnup/controllers/singn_up_controller.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_check_box.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/shared/widgets/app_text_field.dart';
import 'package:ecommerce/shared/widgets/app_password_requirement.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static String route = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  SingnUpController singnUpController = SingnUpController();
  @override
  void initState() {
    super.initState();
  }

  Future<void> login() async {
    setState(() {
      singnUpController.isLoding = true;
    });
    await singnUpController.login();
    setState(() {
      singnUpController.isLoding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)!.settings.arguments);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height:
                MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    child: Text('Criar uma conta', style: AppTextStyle.title),
                  ),
                  Align(
                    child: Text(
                      'Insira seus dados para iniciar suas compras',
                      style: AppTextStyle.subTitle,
                    ),
                  ),
                  AppTextField(
                    errorText: singnUpController.emailError,
                    hintText: 'email@dominio.com',
                    onChanged: (value) {
                      setState(() {
                        singnUpController.setEmail(value);
                      });
                    },
                  ),
                  AppTextField(
                    errorText: singnUpController.nomeError,
                    hintText: 'nome',
                    onChanged: (value) {
                      setState(() {
                        singnUpController.setNome(value);
                      });
                    },
                  ),
                  AppTextField(
                    hintText: 'senha',
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        singnUpController.setSenha(value);
                      });
                    },
                  ),
                  AppTextField(
                    hintText: 'confirmar senha ',
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        singnUpController.setConfirmaSenha(value);
                      });
                    },
                  ),
                  // FORMA DIFERETE DE FAZER
                  // for (var requirement
                  //     in singnUpController.getPasswordRequirements())
                  //   AppPasswordRequirement(
                  //     text: requirement.keys.first,
                  //     isValid: requirement.values.first,
                  //   ),
                  Column(
                    spacing: 5,
                    children: [
                      AppPasswordRequirement(
                        text: 'Mínimo de 6 caracteres',
                        isValid: singnUpController.isSenhaCaracterMinimo,
                      ),
                      AppPasswordRequirement(
                        text: 'No mínimo um caracter especial',
                        isValid: singnUpController.isSenhaEspecial,
                      ),
                      AppPasswordRequirement(
                        text: 'No mínimo uma letra maiúscula',
                        isValid: singnUpController.isSenhaCaracterMaiuscula,
                      ),
                      AppPasswordRequirement(
                        text: 'No mínimo uma letra minúscula',
                        isValid: singnUpController.isSenhaCaracterMinuscula,
                      ),
                      AppPasswordRequirement(
                        text: 'As senhas coincidem',
                        isValid: singnUpController.isConfirmarSenhaValida,
                      ),
                    ],
                  ),
                  const Spacer(flex: 2),

                  Row(
                    children: [
                      AppCheckbox(
                        singnUpController.isActiveChecked,
                        onChanged: (value) {
                          setState(() {
                            singnUpController.changeActiveCheckBox();
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
                    onPressed: singnUpController.isActiveButton
                        ? () => login()
                        : null,
                    isLoad: singnUpController.isLoding,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
