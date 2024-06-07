import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summary;

  const QuestionSummary({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            final correct = data['correct'] as bool;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //number
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: correct
                        ? const Color.fromARGB(151, 255, 255, 255)
                        : const Color.fromARGB(255, 86, 93, 185),
                  ),
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(
                  width: 15,
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: TextStyle(
                          color: correct
                              ? const Color.fromARGB(151, 255, 255, 255)
                              : const Color.fromARGB(255, 145, 142, 175),
                          fontSize: 15,
                        ),
                      ),
                      !correct
                          ? Text(
                              data['correct_answer'] as String,
                              style: const TextStyle(
                                color: Color.fromARGB(151, 255, 255, 255),
                                fontSize: 15,
                              ),
                            )
                          : const SizedBox(
                              height: 0,
                            ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
