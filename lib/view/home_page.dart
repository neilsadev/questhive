import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:questhive/view/quest.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of todo task
  List questList = [
    [
      "Some Name",
      false,
    ],
    [
      "Some Name",
      false,
    ],
    [
      "Some Name",
      false,
    ],
    [
      "Some Name",
      false,
    ],
    [
      "Some Name",
      false,
    ],
    [
      "Some Name",
      false,
    ],
    [
      "Some Name",
      false,
    ],
    [
      "Some Name",
      false,
    ],
    [
      "Some Name",
      false,
    ],
  ];

  // methods

  void checkBoxChanged(
    bool? value,
    int index,
  ) {
    setState(() {
      questList[index][1] = !questList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Quest Hive'),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: questList.length,
          itemBuilder: (context, index) {
            return QuestsPage(
              questName: questList[index][0],
              isTaskCompleted: questList[index][1],
              onChanged: (value) => checkBoxChanged(
                value,
                index,
              ),
            );
          }),
    );
  }
}
