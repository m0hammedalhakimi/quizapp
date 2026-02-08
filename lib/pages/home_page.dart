import 'package:flutter/material.dart';
import 'package:quizapp/widgets/answer_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> answerForQuestion = [
      {"title": "Football", "onPressed": () => debugPrint("Football chosen")},
      {
        "title": "Basketball",
        "onPressed": () => debugPrint("Basketball chosen"),
      },
      {
        "title": "Volleyball",
        "onPressed": () => debugPrint("Volleyball chosen"),
      },
      {
        "title": "Kick boxing",
        "onPressed": () => debugPrint("Kick boxing chosen"),
      },
    ];

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple, Colors.indigo],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Question 1',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'What is your favorite sport?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 48),
                ...answerForQuestion.map(
                  (answerMap) => AnswerItem(
                    title: answerMap['title'],
                    onPressed: answerMap['onPressed'],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
