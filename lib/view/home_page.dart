import 'package:flutter/material.dart';
import 'package:questhive/view/utilities/dialogue_box.dart';
import 'package:questhive/view/utilities/quest.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text cpmtroller
  final _controller = TextEditingController();

  // list of todo task
  List questList = [
    [
      "Some Name",
      false,
    ],
  ];

  // methods

  void saveNewTask() {
    setState(() {
      questList.add([
        _controller.text,
        false,
      ]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogueBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

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
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
