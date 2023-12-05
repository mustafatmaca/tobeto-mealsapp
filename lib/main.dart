import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark, seedColor: Colors.amber));

void main() {
  runApp(MaterialApp(
    theme: theme,
    home: const Categories(),
  ));
}
