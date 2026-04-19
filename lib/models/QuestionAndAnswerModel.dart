class Quiz {
  const Quiz(this.titleQuiz, this.quizAnswer);
  final String titleQuiz;
  final List<String> quizAnswer;
  //To Do:Refactor with getter
  List<String> randomListAnswer() {
    final randomAnswer = List.of(quizAnswer);
    randomAnswer.shuffle();
    return randomAnswer;
  }
}
