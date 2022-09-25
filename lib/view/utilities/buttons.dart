import 'dart:io';
import 'package:flutter/material.dart';

class QuestButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  QuestButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.amber,
      child: Text(text),
    );
  }
}
