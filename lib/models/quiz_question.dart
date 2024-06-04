class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion({required this.text, required this.answers});

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
