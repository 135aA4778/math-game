import 'package:flutter/material.dart';

class AnswerButtons extends StatelessWidget {
  const AnswerButtons({
    required this.onPress,
    required this.answerText,
    super.key,
  });

  final void Function() onPress;
  final String answerText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,

      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 63, 58, 58),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      ),
      child: Text(
        answerText,
        style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)
        ,fontSize:20 ,
        
        ),
      ),
    );
  }
}
