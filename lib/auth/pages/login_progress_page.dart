import 'package:flutter/material.dart';

class MyLoginProgressPage extends StatelessWidget {
  const MyLoginProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
