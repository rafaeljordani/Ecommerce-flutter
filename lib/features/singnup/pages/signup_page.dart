import 'package:ecommerce/features/singnup/controllers/singn_up_controller.dart';
import 'package:ecommerce/shared/app_snack_bar.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_check_box.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/shared/widgets/app_text_field.dart';
import 'package:ecommerce/shared/widgets/app_password_requirement.dart';
import 'package:ecommerce/utils.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static String route = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  SingnUpController singnUpController = SingnUpController();
  Utils utils = Utils();

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _login() async {
    if (key.currentState!.validate()) {
      if (singnUpController.snacBarCheack()) {
        setState(() {
          singnUpController.checkBoxErrorValue = true;
        });
        return;
      }
      setState(() {
        singnUpController.isLoding = true;
      });
    }
    await singnUpController.login();
    setState(() {
      singnUpController.isLoding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)!.settings.arguments);
    return Scaffold(
      body: Form(
        key: key,
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
                      child: Text('Criar uma conta', style: AppTextStyle.title),
                    ),
                    Align(
                      child: Text(
                        'Insira seus dados para iniciar suas compras',
                        style: AppTextStyle.subTitle,
                      ),
                    ),
                    AppTextField(
                      controller: singnUpController.emailControler,
                      validator: (value) {
                        return utils.validaeEmail(
                          singnUpController.emailControler.text,
                        );
                      },
                      hintText: 'email@dominio.com',
                    ),
                    AppTextField(
                      controller: singnUpController.nomeControler,
                      validator: (value) {
                        return utils.validateNome(
                          singnUpController.nomeControler.text,
                        );
                      },
                      hintText: 'nome',
                    ),
                    AppTextField(
                      validator: (value) {
                        return singnUpController.validadeSenha(value);
                      },
                      hintText: 'senha',
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          singnUpController.setSenha(value);
                        });
                      },
                    ),
                    AppTextField(
                      validator: (value) {
                        return singnUpController.validadeConfirmaSenha(value);
                      },
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
                          errorValue: singnUpController.checkBoxErrorValue,
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
                      onPressed: () {
                        _login();
                      },
                      isLoad: singnUpController.isLoding,
                    ),
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
