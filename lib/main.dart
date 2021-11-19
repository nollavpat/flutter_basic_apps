import 'package:flutter/material.dart';

import './question.dart';

void main() => runApp(const QuizApp());

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<String> questions = ['Sino pogi?', 'Bat bubu ka?', 'Anong date ngayon?'];

  int _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      int newQuestionIndex = _questionIndex + 1;
      if (newQuestionIndex > questions.length - 1) {
        _questionIndex = 0;
      } else {
        _questionIndex = _questionIndex + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Patrick Quiz'),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]),
            ElevatedButton(
                onPressed: _answerQuestion, child: const Text('Answer 1')),
            ElevatedButton(
                onPressed: _answerQuestion, child: const Text('Answer 1'))
          ],
        ),
      ),
    );
  }
}
