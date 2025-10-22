import 'package:flutter/material.dart';

class MyGestures extends StatelessWidget {
  const MyGestures({super.key});

  @override
  Widget build(BuildContext context) {
    //Trả về Scaffold - widget cung cấp bố cục Material Design cơ bản
    // Màn hình
    return Scaffold(
      // Tieu de
      appBar: AppBar(
        title: Text("App_03"),
        backgroundColor: Colors.blueAccent,
        //Do nang/ do bong cua AppBar
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              print("b1");
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("b2");
            },
            icon: Icon(Icons.abc),
          ),
          IconButton(
            onPressed: () {
              print("b3");
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),

      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            //GestureDetector
            GestureDetector(
              onTap: () {
                print("Content is touched");
              },
              onDoubleTap: () {
                print("Content is double touched");
              },
              onPanUpdate: (detail){
                print('Move: ${detail.delta}');
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blueAccent,
                child: Center(child: Text("Touch me")),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("FloatingActionButton");
        },
        child: const Icon(Icons.add_ic_call_outlined),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chu"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tim kiem"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "ca nhan"),
        ],
      ),
    );
  }
}
