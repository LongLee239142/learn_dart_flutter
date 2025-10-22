import 'package:flutter/material.dart';
class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    //Trả về Scaffold - widget cung cấp bố cục Material Design cơ bản
    // Màn hình
    return Scaffold(
      // Tieu de
       appBar: AppBar(
         title: Text("App_02"),
         backgroundColor: Colors.blueAccent,
       ),

      backgroundColor: Colors.deepOrange,

      body: Center(
        child: Text("Main Content"),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: (){
            print("pressed");
      },
        child:const Icon(Icons.call) ,
      ),

      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chu" ),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tim kiem" ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "ca nhan" ),
      ]),
    );
  }
  
}