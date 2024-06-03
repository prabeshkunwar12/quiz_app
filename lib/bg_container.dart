import 'package:flutter/material.dart';

class BgContainer extends StatelessWidget {
  const BgContainer({super.key});

  @override
  Widget build(context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/images/quiz-logo.png'),
          ),
        ],
      ),
    );
  }
}
