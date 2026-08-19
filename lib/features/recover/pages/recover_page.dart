import 'package:ecommerce/features/recover/controllers/recover_controller.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

class RecoverPage extends StatefulWidget {
  const RecoverPage({super.key});

  static const String route = '/recover';

  @override
  State<RecoverPage> createState() => _RecoverPageState();
}

class _RecoverPageState extends State<RecoverPage> {
  RecoverController recoverController = RecoverController();

  @override
  Widget build(BuildContext context) {
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Recuperar senha', style: AppTextStyle.title),
                  AppTextField(
                    hintText: 'email@dominio.com',

                    onChanged: (value) {
                      setState(() {
                        recoverController.setEmail(value);
                      });
                    },
                  ),
                  const Spacer(),
                  AppElevatedButton(
                    onPressed: recoverController.isActiveButton
                        ? () {
                            AnimatedSnackBar.material(
                              'Código enviado com sucesso',
                              type: AnimatedSnackBarType.success,
                              mobileSnackBarPosition:
                                  MobileSnackBarPosition.bottom,
                            ).show(context);
                          }
                        : null,
                    type: ButtonType.filled,
                    textButton: 'Continuar',
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
