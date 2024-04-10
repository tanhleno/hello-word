import 'package:flutter/material.dart';
import 'package:helloworld/pages/login.dart';
import 'signup.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/images/logo.png')),
            const SizedBox(height: 20),
            FilledButton(
              child: const Text('Entrar'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              child: const Text('Cadastrar-se'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
