import 'package:flutter/material.dart';

getLightTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blue,
  );
  final base = ThemeData.from(
    colorScheme: colorScheme,
  );

  return base;
}
