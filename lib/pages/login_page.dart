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
              const Text('+DevsEcomm'),
              const Spacer(flex: 2),
              TextField(),
              TextField(),
              TextButton(
                onPressed: () {},
                child: const Text('Esqueci minha senha'),
              ),
              ElevatedButton(onPressed: () {}, child: const Text('Entrar')),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Cadastrar-se'),
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
