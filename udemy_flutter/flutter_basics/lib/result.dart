import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  // ignore: use_key_in_widget_constructors
  const Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 20) {
      resultText = "You suck bitch!";
    } else if (resultScore <= 25) {
      resultText = "You're aight...";
    } else if (resultScore <= 30) {
      resultText = "You're getting warmer.";
    } else {
      resultText = "You're awesome!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetHandler,
            child: const Text("Restart Quiz!"),
          )
        ],
      ),
    );
  }
}
