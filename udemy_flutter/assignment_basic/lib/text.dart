import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordText extends StatelessWidget {
  final String wordText;

  // ignore: use_key_in_widget_constructors
  const WordText(this.wordText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(30),
      child: Text(
        wordText,
        style: const TextStyle(
          fontSize: 28,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
