import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> answers;
  final void Function() restart;

  const ResultsScreen(
      {super.key, required this.answers, required this.restart});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    final len = answers.length;

    for (var i = 0; i < len; i++) {
      final question = questions[i];
      final answer = answers[i];
      summary.add({
        'question_index': i,
        'question': question.text,
        'correct_answer': question.answers[0],
        'user_answer': answer,
        'correct': question.answers[0] == answer,
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnsweredQuestions = summaryData.where((data) {
      return data['correct'] as bool;
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectAnsweredQuestions out of $numTotalQuestions questions correctly.',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 190, 194, 241),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summary: summaryData),
            TextButton(
              onPressed: restart,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.restart_alt_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                  Text(
                    'Restart Quiz!',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
