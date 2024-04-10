import 'package:flutter/material.dart';
//import 'package:helloworld/pages/client.dart';
import 'package:helloworld/pages/home.dart';
import 'package:helloworld/themes/default.dart';
//import 'pages/home.dart';
//import 'theme.dart'

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hello World',
      theme: DefaultTheme.theme,
      home: const HomePage(),
    );
  }
}
