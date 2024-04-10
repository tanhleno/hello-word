import 'package:flutter/material.dart';
import 'package:helloworld/pages/client.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um email válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma senha válida';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    rootBundle
                        .loadString('assets/data/clients.json')
                        .then((data) {
                      List clients = json.decode(data);
                      bool hasClient = false;
                      for (int i = 0; i < clients.length; i++) {
                        if (clients[i]['email'] == emailController.text &&
                            clients[i]['password'] == passwordController.text) {
                          hasClient = true;
                        }
                      }
                      if (hasClient) {
                        rootBundle
                            .loadString('assets/data/books.json')
                            .then((data) {
                          List allBooks = json.decode(data);
                          List books = [];
                          for (int i = 0; i < allBooks.length; i++) {
                            if (allBooks[i]['client'] == emailController.text) {
                              books.add(allBooks[i]);
                            }
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClientPage(books: books),
                            ),
                          );
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Cliente não encontrado'),
                          ),
                        );
                      }
                    });
                  }
                },
                child: const Text('Efetuar login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
