import 'package:flutter/material.dart';

class TextHomePage extends StatelessWidget {
  const TextHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Welcome to the Quiz maker',
      style: TextStyle(
        color: Color.fromARGB(255, 32, 31, 31),
        fontSize: 24,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}