import 'package:flutter/material.dart';

import '../modal/items.dart';
import '../widget/card_body_widget.dart';
import '../widget/card_modal_bottom.dart';
import '../widget/drawer_widget.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItems> items = [];
  final List<DataItems> hisItems = [];

  void _handleAddTask(String name, DateTime date, TimeOfDay time) {
    final newItem = DataItems(id: DateTime.now().toString(), name: name, date: date, time: time);
    setState(() {
      items.add(newItem);
    });
  }

  void _handleDeleteTask(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  void _handleDoneTask(String id) {
    setState(() {
      DataItems x = items[0];
      for (DataItems i in items) {
        if(i.id == id) {
          x = i;
          break;
        }
      }

      hisItems.add(x);
      items.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 21, 21),
      appBar: AppBar(
        centerTitle: true, // hoặc bọc ngoài title 1 widget Center
        title: const Text(
          'ToDoList',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 10, 182, 171),
      ),
      endDrawer: DrawerWidget(hisItems: hisItems,),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: items
              .map((item) => CardBody(
            // index: items.indexOf(item),
            item: item,
            handleDelete: _handleDeleteTask,
            handleDone: _handleDoneTask,
          ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 10, 182, 171),
        onPressed: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(20))),
              isScrollControlled: true,
              context: context,
              builder: (BuildContext content) {
                return ModalBottom(addTask: _handleAddTask);
              });
        }, // truyền các sự kiện khi nhấn vào button
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}