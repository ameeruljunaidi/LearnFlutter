import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final VoidCallback selectHandler;

  // ignore: use_key_in_widget_constructors
  const TextControl(this.selectHandler);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selectHandler,
        child: const Text("Change the word"),
      ),
    );
  }
}
