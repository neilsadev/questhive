import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:questhive/view/home_page.dart';

void main() async {
  //init hive
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quest Hive',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(),
    );
  }
}
