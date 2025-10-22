import 'package:flutter/material.dart';
class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    //Trả về Scaffold - widget cung cấp bố cục Material Design cơ bản
    // Màn hình
    return Scaffold(
      // Tieu de
      appBar: AppBar(
        title: Text("App_04"),
        backgroundColor: Colors.blueAccent,
        //Do nang/ do bong cua AppBar
        elevation: 4,
        actions: [
          IconButton(
              onPressed: (){
                print("b1");
              },
              icon: Icon(Icons.search)
          ),
          IconButton(
              onPressed: (){
                print("b2");
              },
              icon: Icon(Icons.abc)
          ),
          IconButton(
              onPressed: (){
                print("b3");
              },
              icon: Icon(Icons.more_vert)
          )
        ],

      ),


      backgroundColor: Colors.white,

      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: const Offset(5, 5)
              )
            ]
          ),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.center,
            child: const Text(
                "LongLee",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("pressed");
        },
        child:const Icon(Icons.add_ic_call_outlined) ,
      ),

      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chu" ),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tim kiem" ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "ca nhan" ),
      ]
      ),
    );
  }

}