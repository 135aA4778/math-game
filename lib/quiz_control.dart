import 'package:flutter/material.dart';
import 'package:question_app/home_page/Homepage.dart';
import 'package:question_app/data/DataQuestionAndAnswer.dart';
import 'package:question_app/pages/QuizPages.dart';
import 'package:question_app/pages/Result_Screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  Widget? activeScreen;
  List<String> userAnswer = [];

  void resetApp() {
    setState(() {
      userAnswer.clear();
      activeScreen = HomePage(switchScreen);
    });
  }

  void choosedAnswer(String answer) {
    userAnswer.add(answer);
    setState(() {
      if (userAnswer.length == questionsAndAnswer.length) {
        final resultAnswerForSend = List<String>.from(userAnswer);
        userAnswer.clear();
        activeScreen = ResultScreen(
          choosedAnswer: resultAnswerForSend,
          restartApp: resetApp,
          quizData: questionsAndAnswer,
        );
      }
    });
  }

  @override
  void initState() {
    activeScreen = HomePage(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = Pages(selectedAnswer: choosedAnswer);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(home: Scaffold(body: activeScreen));
  }
}
