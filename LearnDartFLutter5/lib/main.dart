import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
      home: Widget1()
    )
  );
}
class Widget1 extends StatefulWidget {
  const Widget1({super.key});

  @override
   State<Widget1> createState() => _Widget1State();
}

class _Widget1State extends State<Widget1> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
