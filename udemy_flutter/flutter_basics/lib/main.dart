import 'package:flutter/material.dart';
import './question.dart';

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

  void _answerQuestion() {
    setState(
      () {
        _questionIndex = _questionIndex + 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      "What's your favorite color?",
      "What's your favorite animal?"
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello"),
        ),
        body: Column(
          children: [
            Question(
              questions.elementAt(_questionIndex),
            ),
            ElevatedButton(
              child: const Text("Answer 1"),
              onPressed: _answerQuestion,
            ),
            ElevatedButton(
              child: const Text("Answer 2"),
              onPressed: _answerQuestion,
            ),
            ElevatedButton(
              child: const Text("Answer 3"),
              onPressed: _answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
