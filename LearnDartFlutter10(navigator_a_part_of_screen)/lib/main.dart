import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: Scaffold(body: Body())),
    ),
  );
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Navigator(
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case Area1.Route:
                    return MaterialPageRoute(builder: (context) => Area1());
                  case Area11.Route:
                    return MaterialPageRoute(builder: (context) => Area11());
                  default:
                    return MaterialPageRoute(builder: (context) => Area1());
                }
              },
              //initialRoute: Area1.Route,
            ),
          ),
          Expanded(
            flex: 1,
            child: Navigator(
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case Area2.Route:
                    return MaterialPageRoute(builder: (context) => Area2());
                  case Area21.Route:
                    return MaterialPageRoute(builder: (context) => Area21());
                  default:
                    return MaterialPageRoute(builder: (context) => Area2());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Area1 extends StatelessWidget {
  static const String Route = "Area1"; //TAG

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Area11.Route);
            // Navigator.of(context, rootNavigator: true).push(
            //   MaterialPageRoute(
            //     builder: (context) => Area11(),
            //   ),
            // );
            // menu button outside -> access any navigator -> access by key
          },
          child: Text("Area1 to Area11"),
        ),
      ),
    );
  }
}

class Area11 extends StatelessWidget {
  static const String Route = "Area11"; //TAG

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Back to Area1 "),
        ),
      ),
    );
  }
}

class Area2 extends StatelessWidget {
  static const String Route = "Area2";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(context, Area21.Route);
          },
          child: Text("Area2 to Area21"),
        ),
      ),
    );
  }
}

class Area21 extends StatelessWidget {
  static const String Route = "Area21";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Back to Area2"),
        ),
      ),
    );
  }
}
