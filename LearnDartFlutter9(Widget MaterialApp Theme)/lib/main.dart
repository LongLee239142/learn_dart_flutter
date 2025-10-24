import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "MaterialApp title",
      debugShowCheckedModeBanner: false,
      theme: AppThemeByLongLee.lightTheme,
      darkTheme: AppThemeByLongLee.darkTheme,

      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("AppBar Title")),
          body: Body(),
        ),
      ),
    ),
  );
}

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: () {}, child: Text("Button")),
        OutlinedButton(onPressed: () {}, child: Text("OutlineButton")),
        Text("Hello LongLee",
         style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class AppThemeByLongLee {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorSchemeSeed: Colors.redAccent,
    useMaterial3: true,
    textTheme: textTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorSchemeSeed: Colors.green,
    useMaterial3: true,
    textTheme: textTheme,
  );
  static TextTheme textTheme = TextTheme(
    bodyLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  );
}
