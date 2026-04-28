import 'package:flutter/material.dart';
import 'package:question_app/home_page/TextHomePage.dart';
import 'package:persian_fonts/persian_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/norooz_icon.png', width: 250, height: 250),
          const SizedBox(height: 50),
          const TextHomePage(),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              switchScreen();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 212, 175, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(
              Icons.arrow_forward,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 25,
            ),
            label: Text(
              'شروع بازی',
              style: PersianFonts.Vazir.copyWith(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}