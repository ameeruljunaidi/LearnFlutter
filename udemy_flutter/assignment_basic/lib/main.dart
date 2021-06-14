// 1) Create a new Flutter App (in this project) and output an AppBar
// and some text below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './app.dart';

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
  var _wordIndex = 0;

  final _wordList = [
    "This is the the first one.",
    "This is the second one.",
  ];

  void _changeWord() {
    setState(() {
      _wordIndex = _wordIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Assignment"),
        ),
        body: _wordIndex < _wordList.length
            ? WordApp(
                _wordList,
                _wordIndex,
                _changeWord,
              )
            : Container(
                width: double.infinity,
                margin: const EdgeInsets.all(30),
                child: const Text(
                  "Done!",
                  style: TextStyle(
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
      ),
    );
  }
}
