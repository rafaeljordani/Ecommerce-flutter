import 'package:ecommerce/features/singnup/controllers/singn_up_controller.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_check_box.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/shared/widgets/app_text_field.dart';
import 'package:ecommerce/shared/widgets/app_password_requirement.dart';
import 'package:ecommerce/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  static String route = '/signup';

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)!.settings.arguments);
    return Scaffold(
      body: Consumer<SingnUpController>(
        builder: (context, controller, child) {
          return Form(
            key: controller.key,
            child: SafeArea(
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
                          child: Text(
                            'Criar uma conta',
                            style: AppTextStyle.title,
                          ),
                        ),
                        Align(
                          child: Text(
                            'Insira seus dados para iniciar suas compras',
                            style: AppTextStyle.subTitle,
                          ),
                        ),
                        AppTextField(
                          controller: controller.emailControler,
                          validator: (value) {
                            return Utils.validaeEmail(
                              controller.emailControler.text,
                            );
                          },
                          hintText: 'email@dominio.com',
                        ),
                        AppTextField(
                          controller: controller.nomeControler,
                          validator: (value) {
                            return Utils.validateNome(
                              controller.nomeControler.text,
                            );
                          },
                          hintText: 'nome',
                        ),
                        AppTextField(
                          validator: (value) {
                            return controller.validadeSenha(value);
                          },
                          hintText: 'senha',
                          obscureText: true,
                          onChanged: (value) {
                            controller.setSenha(value);
                          },
                        ),
                        AppTextField(
                          validator: (value) {
                            return controller.validadeConfirmaSenha(value);
                          },
                          hintText: 'confirmar senha ',
                          obscureText: true,
                          onChanged: (value) {
                            controller.setConfirmaSenha(value);
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
                              isValid: controller.isSenhaCaracterMinimo,
                            ),
                            AppPasswordRequirement(
                              text: 'No mínimo um caracter especial',
                              isValid: controller.isSenhaEspecial,
                            ),
                            AppPasswordRequirement(
                              text: 'No mínimo uma letra maiúscula',
                              isValid: controller.isSenhaCaracterMaiuscula,
                            ),
                            AppPasswordRequirement(
                              text: 'No mínimo uma letra minúscula',
                              isValid: controller.isSenhaCaracterMinuscula,
                            ),
                            AppPasswordRequirement(
                              text: 'As senhas coincidem',
                              isValid: controller.isConfirmarSenhaValida,
                            ),
                          ],
                        ),
                        const Spacer(flex: 2),

                        Row(
                          children: [
                            AppCheckbox(
                              errorValue: controller.checkBoxErrorValue,
                              controller.isActiveChecked,
                              onChanged: (value) {
                                controller.changeActiveCheckBox();
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
                          onPressed: () {
                            controller.hadleSignUp();
                          },
                          isLoad: controller.isLoding,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
