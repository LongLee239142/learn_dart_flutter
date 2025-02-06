import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // Căn giữa theo trục ngang
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // Căn giữa theo trục ngang
                children: [
                  boxMethod('LongLee1', Alignment.bottomRight),
                  boxMethod('LongLee2', Alignment.bottomLeft),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // Căn giữa theo trục ngang
                children: [
                  boxMethod('LongLee3', Alignment.topRight),
                  boxMethod('LongLee4', Alignment.topLeft),
                ],
              ),
            ],
          ),
          Center(child: boxMethod("Hello LongLee", Alignment.center,true))
        ]),
      ),
    );
  }

  Container boxMethod(String name, Alignment direction, [bool boxRadius = false]) {
    return Container(
      decoration: BoxDecoration(
      color: boxRadius ? Colors.blue : Colors.green,
        borderRadius: BorderRadius.circular(boxRadius ? 100: 0)

      ),
      alignment: direction,
      width: 160,
      height: 160,
      child: Text(
        name,
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    );
  }
}
