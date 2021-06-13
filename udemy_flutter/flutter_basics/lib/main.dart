import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(
    MyApp(),
  );
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  static const _questions = [
    {
      "questionText": "Who is the best driver on the grid now?",
      "answers": ["Lewis", "Max", "Lando", "Sergio"],
    },
    {
      "questionText": "Which is the best contructor?",
      "answers": ["Mercedes", "Red Bull", "Ferrari", "McLaren"],
    },
    {
      "questionText": "Which is the best track?",
      "answers": ["Spa", "Suzuka", "Italy", "Catalunya"],
    },
  ];

  void _answerQuestion() {
    setState(
      () {
        _questionIndex = _questionIndex + 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Question & Answers App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(),
      ),
    );
  }
}
