import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';

class TextHomePage extends StatelessWidget {
  const TextHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'به اپلیکیشن ماتریس خوش آمدید',
      style: PersianFonts.Vazir.copyWith(
        color: const Color.fromARGB(255, 32, 31, 31),
        fontSize: 24,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
