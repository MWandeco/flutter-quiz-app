import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/questionsSummary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        color: Color.fromARGB(255, 230, 200, 253),
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 30,
                ),
                QuestionsSummary(summaryData),
                const SizedBox(
                  height: 30,
                ),
                OutlinedButton.icon(
                    onPressed: onRestart,
                    style: OutlinedButton.styleFrom(
                      elevation: 20,
                    ),
                    icon: const Icon(Icons.restart_alt_rounded),
                    label: const Text(
                      'Restart Quiz',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
              ],
            )));
  }
}
