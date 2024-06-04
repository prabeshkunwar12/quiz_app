import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  void select() {}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'the question',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          AnswerButton(
            text: 'Answer 1',
            select: select,
          ),
          AnswerButton(
            text: 'Answer 2',
            select: select,
          ),
          AnswerButton(
            text: 'Answer 3',
            select: select,
          ),
          AnswerButton(
            text: 'Answer 4',
            select: select,
          ),
        ],
      ),
    );
  }
}
