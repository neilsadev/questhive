import 'package:hive_flutter/hive_flutter.dart';

class QuestDataBase {
  List questList = [];

  final _myBox = Hive.box('mybox');

  void createInitialData() {
    questList = [
      ["Some Tasks", false],
      ["Some Other Tasks", false],
    ];
  }

  void loadData() {
    questList = _myBox.get("QUESTLIST");
  }

  void updateDataBase() {
    _myBox.put("QUESTLIST", questList);
  }
}
