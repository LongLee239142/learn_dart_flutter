import 'package:app_weather/page/detail/detail_page.dart';
import 'package:app_weather/page/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonNavigationCustom extends StatefulWidget {
  const ButtonNavigationCustom({super.key});

  @override
  State<ButtonNavigationCustom> createState() => _ButtonNavigationCustomState();
}

class _ButtonNavigationCustomState extends State<ButtonNavigationCustom> {
  List<BottomNavigationBarItem> listItems = [
    // Correct type here
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.list_bullet), label: 'List'),
  ];
  List<Widget> listPages = [
    HomePage(),
    DetailPage(),
  ];
int activePage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: listPages[activePage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activePage,
        selectedItemColor: Colors.white54,
        backgroundColor: Colors.white10,
        elevation: 0,
        onTap: (index){
          setState(() {
         activePage = index;
          });
        },
        items: listItems,
      ), // Use listItems here
    );
  }
}
