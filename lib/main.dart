import 'dart:math';

import 'package:flutter/material.dart';
import 'package:to_do_app/src/my_app.dart';
import 'package:to_do_app/widget/drawer_widget.dart';
import 'widget/card_body_widget.dart';
import 'widget/card_modal_bottom.dart';

import 'modal/items.dart';

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
