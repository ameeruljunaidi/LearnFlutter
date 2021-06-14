import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:assignment_basic/text.dart';
import 'package:assignment_basic/text_control.dart';

class WordApp extends StatelessWidget {
  final List<String> wordList;
  final int wordIndex;
  final VoidCallback changeWord;

  // ignore: use_key_in_widget_constructors
  const WordApp(
    this.wordList,
    this.wordIndex,
    this.changeWord,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WordText(wordList[wordIndex]),
        // ignore: prefer_const_constructors
        TextControl(changeWord)
      ],
    );
  }
}
