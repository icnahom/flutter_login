import 'package:flutter/material.dart';

getDarKTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.dark,
  );
  final base = ThemeData.from(
    colorScheme: colorScheme,
  );

  return base;
}
