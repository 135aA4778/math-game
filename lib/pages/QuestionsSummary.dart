import 'package:flutter/material.dart';

class Questionssummary extends StatelessWidget {
  const Questionssummary({
    required this.dataSummary,
    required this.userAnswerChecker,
    super.key,
  });

  final List<Map<String, Object>> dataSummary;
  final List<Color> userAnswerChecker;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...dataSummary.map((data) {
              final colorChecker =
                  userAnswerChecker[data['question index'] as int];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: colorChecker,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Text(
                        ((data['question index'] as int) + 1).toString(),
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['questions'] as String,
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            data['user choosed answer'] as String,
                            style: TextStyle(fontSize: 20, color: colorChecker),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            data['correct answer'] as String,
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
