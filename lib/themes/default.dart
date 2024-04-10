import 'package:flutter/material.dart';

abstract class DefaultTheme {
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.lightGreen,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(34, 18, 34, 18),
        textStyle: const TextStyle(fontSize: 18),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(34, 18, 34, 18),
        textStyle: const TextStyle(fontSize: 18),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(34, 18, 34, 18),
        textStyle: const TextStyle(fontSize: 16),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(fontSize: 18),
      hintStyle: TextStyle(fontSize: 16),
      floatingLabelStyle: TextStyle(fontSize: 18, height: 1),
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
  );
}
