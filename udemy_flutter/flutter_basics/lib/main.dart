import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void answerQuestion() {
    setState(
      () {
        questionIndex = questionIndex + 1;
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
            Text(
              questions.elementAt(questionIndex),
            ),
            RaisedButton(
              child: const Text("Answer 1"),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: const Text("Answer 2"),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: const Text("Answer 3"),
              onPressed: answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
