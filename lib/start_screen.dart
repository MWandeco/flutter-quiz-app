import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          width: 300,
          child: Opacity(
              opacity: 0.6, child: Image.asset('assets/images/quiz-logo.png')),
        ),
        const SizedBox(
          height: 60,
        ),
        Text(
          'Learn Flutter the fun Way !',
          style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 201, 153, 251),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 40,
        ),
        OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              elevation: 20,
            ),
            icon: const Icon(Icons.arrow_right_alt_sharp),
            label: const Text(
              'Start Quiz',
              style: TextStyle(color: Colors.white, fontSize: 16),
            )),
      ]),
    );
  }
}
