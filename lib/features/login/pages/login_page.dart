import 'package:ecommerce/features/home/pages/home_page.dart';
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
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Safeare desconta espaços do dispositivo ex:barra superior
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<LoginController>(
            builder: (context, controller, child) {
              return Form(
                key: controller.key,
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
                          controller: controller.emailControler,
                          validator: (value) {
                            return Utils.validaeEmail(
                              controller.emailControler.text,
                            );
                          },
                          hintText: 'email@dominio.com',
                        ),
                        const SizedBox(height: 20),
                        AppTextField(
                          validator: (value) {
                            return Utils.validateSenha(
                              controller.senhaControler.text,
                            );
                          },
                          hintText: '************',
                          obscureText: true,
                          controller: controller.senhaControler,
                        ),
                        Row(
                          children: [
                            AppCheckbox(
                              controller.isActiveChecked,
                              onChanged: (value) {
                                controller.changeActiveBox();
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
                          onPressed: () async {
                            try {
                              await controller.handleLogin();
                              Navigator.pushNamed(
                                context,
                                HomePage.route,
                                arguments: 'vim da login',
                              );
                            } catch (e) {
                              //algo aqui
                            }
                          },
                          textButton: 'Entrar',
                          isLoad: controller.isLoding,
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
            },
          ),
        ),
      ),
    );
  }
}
