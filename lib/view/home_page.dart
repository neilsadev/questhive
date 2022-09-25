import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:questhive/model/database.dart';
import 'package:questhive/view/utilities/dialogue_box.dart';
import 'package:questhive/view/utilities/quest.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');
  // text cpmtroller
  final _controller = TextEditingController();

  // list of todo task
  QuestDataBase db = QuestDataBase();

  // methods

  void saveNewTask() {
    setState(() {
      db.questList.add([
        _controller.text,
        false,
      ]);
      _controller.clear();
    });
    db.updateDataBase();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Quest Added"),
    ));
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

  void deleteTask(int index) {
    setState(() {
      db.questList.remove(db.questList[index]);
    });
    db.updateDataBase();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Quest Deleted"),
    ));
  }

  void checkBoxChanged(
    bool? value,
    int index,
  ) {
    setState(() {
      db.questList[index][1] = !db.questList[index][1];
    });
    db.updateDataBase();
  }

  @override
  void initState() {
    // TODO: implement initState
    if (_myBox.get("QUESTLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
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
        itemCount: db.questList.length,
        itemBuilder: (context, index) {
          return QuestsPage(
            questName: db.questList[index][0],
            isTaskCompleted: db.questList[index][1],
            onChanged: (value) => checkBoxChanged(
              value,
              index,
            ),
            deleteFunction: (context) => deleteTask(index),
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
