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
  static const _questions = [
    {
      "questionText": "Who is the best driver on the grid now?",
      "answers": [
        {"text": "Lewis", "score": 10},
        {"text": "Max", "score": 8},
        {"text": "Lando", "score": 6},
        {"text": "Sergio", "score": 4}
      ],
    },
    {
      "questionText": "Which is the best contructor?",
      "answers": [
        {"text": "Mercedes", "score": 10},
        {"text": "Red Bull", "score": 8},
        {"text": "McLaren", "score": 6},
        {"text": "Ferrari", "score": 4}
      ],
    },
    {
      "questionText": "Which is the best track?",
      "answers": [
        {"text": "Spa", "score": 10},
        {"text": "Catalunya", "score": 8},
        {"text": "Suzuka", "score": 6},
        {"text": "Sepang", "score": 4}
      ],
    },
    {
      "questionText": "What is your name?",
      "answers": [
        {"text": "John", "score": 10},
        {"text": "Ezekiel", "score": 5},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(
      () {
        _questionIndex = 0;
        _totalScore = 0;
      },
    );
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

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
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
