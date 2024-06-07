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
                    children: [
                      AlignmentContainer(
                        child: Text(
                          data['question'] as String,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AlignmentContainer(
                        child: Text(
                          data['user_answer'] as String,
                          style: TextStyle(
                            color: correct
                                ? const Color.fromARGB(151, 255, 255, 255)
                                : const Color.fromARGB(255, 145, 142, 175),
                            fontSize: 15,
                          ),
                        ),
                      ),
                      AlignmentContainer(
                        child: !correct
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

class AlignmentContainer extends StatelessWidget {
  final Widget child;
  const AlignmentContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: child,
    );
  }
}
