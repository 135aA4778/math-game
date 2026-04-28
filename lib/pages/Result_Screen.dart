import 'package:flutter/material.dart';
import 'package:question_app/pages/QuestionsSummary.dart';
import 'package:question_app/models/QuestionAndAnswerModel.dart';
import 'package:persian_fonts/persian_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.quizData,
    required this.choosedAnswer,
    required this.restartApp,
  });
  final VoidCallback restartApp;
  final List<String> choosedAnswer;
  final List<Quiz> quizData;
  
  //To Do:Refactor with getter
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (
      int userAnswerIndex = 0;
      userAnswerIndex < choosedAnswer.length;
      userAnswerIndex++
    ) {
      summary.add({
        'question index': userAnswerIndex,
        'user choosed answer': choosedAnswer[userAnswerIndex],
        'questions': quizData[userAnswerIndex].titleQuiz,
        'correct answer': quizData[userAnswerIndex].quizAnswer[0],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> summaryDataQuiz = getSummaryData();
    final numberTotalQuestions = quizData.length;
    final numberUserCorrectQuestions = summaryDataQuiz.where((data) {
      return data['correct answer'] == data['user choosed answer'];
    }).length;

    final List<Color> checkUserAnswer = [];

    for (var element in summaryDataQuiz) {
      if (element['correct answer'] == element['user choosed answer']) {
        checkUserAnswer.add(Colors.blue);
      } else {
        checkUserAnswer.add(const Color.fromARGB(255, 213, 15, 81));
      }
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "شما پاسخ دادید به $numberUserCorrectQuestions از $numberTotalQuestions سوال",
              style:  PersianFonts.Vazir.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blue,),
              ),
           
            SizedBox(height: 30),
            Questionssummary(
              dataSummary: summaryDataQuiz,
              userAnswerChecker: checkUserAnswer,
            ),
            SizedBox(height: 30),

            // const Text("List of answers and questions...."),
            TextButton(
              onPressed: restartApp,
              child: Text(
                'Restart Quize',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
