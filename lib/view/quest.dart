import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class QuestsPage extends StatelessWidget {
  final String questName;
  final bool isTaskCompleted;
  Function(bool?)? onChanged;

  QuestsPage({
    super.key,
    required this.questName,
    required this.isTaskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Checkbox(
              value: isTaskCompleted,
              onChanged: onChanged,
            ),
            // quest title
            Text("some text"),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
