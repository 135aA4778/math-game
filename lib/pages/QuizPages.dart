import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:question_app/models/AnswerButtons.dart';
import 'package:question_app/data/DataQuestionAndAnswer.dart';

class Pages extends StatefulWidget {
  const Pages({super.key, required this.selectedAnswer});
  final Function(String answer) selectedAnswer;
  @override
  State<Pages> createState() {
    return _PageTwoState();
  }
}

class _PageTwoState extends State<Pages> {
  int numberOfDataQuize = 0;

  void switchDataQuiz(String selectedAns) {
    widget.selectedAnswer(selectedAns);
    setState(() {
      numberOfDataQuize++;
    });
  }

  @override
  Widget build(context) {
    final currentDataQuize = questionsAndAnswer[numberOfDataQuize];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentDataQuize.titleQuiz,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          SizedBox(height: 30),
          ...currentDataQuize.randomListAnswer().map((answer) {
            return Column(
              children: [
                AnswerButtons(
                  onPress: () {
                    switchDataQuiz(answer);
                  },
                  answerText: answer,
                ),
                const SizedBox(height: 16),
              ],
            );
          }),
          // AnswerButtons(onPress: () {}, answerText: dataQuize.quizAnswer[0]),
          // AnswerButtons(onPress: () {}, answerText: dataQuize.quizAnswer[1]),
          // AnswerButtons(onPress: () {}, answerText: dataQuize.quizAnswer[2]),
          // AnswerButtons(onPress: () {}, answerText: dataQuize.quizAnswer[3]),
        ],
      ),
    );
  }
}
