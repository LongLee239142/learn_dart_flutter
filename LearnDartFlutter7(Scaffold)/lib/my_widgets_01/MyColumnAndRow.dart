import 'package:flutter/material.dart';
class MyColumnAndRow extends StatelessWidget {
  const MyColumnAndRow({super.key});

  @override
  Widget build(BuildContext context) {
    //Trả về Scaffold - widget cung cấp bố cục Material Design cơ bản
    // Màn hình
    return Scaffold(
      // Tieu de
      appBar: AppBar(
        title: Text("App_05"),
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
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(height: 50,),
                Icon(Icons.access_alarm),
                Icon(Icons.ac_unit),
                Icon(Icons.person),
              ],
            ),
            Row(
              children: [
                Text("Text1"),
                Text("Text2"),
                Text("Text3"),
                Text("Text4")
              ],
            )
          ],
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