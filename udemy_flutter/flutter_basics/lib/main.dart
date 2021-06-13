import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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

  static const questions = [
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

    if (_questionIndex < questions.length) {
      print("We have more questions!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Question & Answers App"),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
