import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:projectappbase/model/Items.dart';
import 'package:projectappbase/widget/car_body_widget.dart';
import 'package:projectappbase/widget/car_model_button.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItems> items = [];

  void handlerAddTask(String name) {
    final newItems = DataItems(DateTime.now().toString(), name);
    setState(() {
      items.add(newItems);
    });
  }

  void handlerDeleteTask(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ToDoList",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: items
              .map((item) => boxContainer(
                    item: item,
                    handlerDelete: handlerDeleteTask,
                    index: items.indexOf(item).toDouble(),
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            context: context,
            builder: (BuildContext context) {
              print(context);
              return ModelButton(addTask: handlerAddTask);
            },
          );
          print("Floating button clicked!");
        },
        child: Icon(Icons.add, size: 40),
      ),
    );
  }
}
