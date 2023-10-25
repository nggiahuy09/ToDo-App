import 'package:flutter/material.dart';
import 'package:to_do_app/src/my_app.dart';

void main() {
  runApp(MaterialApp(
    title: "ToDoList",
    theme: ThemeData(
      brightness: Brightness.light,
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
    ),
    themeMode: ThemeMode.light,
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
