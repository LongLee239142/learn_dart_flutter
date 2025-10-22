import 'package:flutter/material.dart';

class MyButton_3 extends StatelessWidget {
  const MyButton_3({super.key});

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
            // ElevatedButton là một button nổi với hiệu ứng đổ bóng,
            // thường được sử dụng cho các hành động chính trong ứng dụng.
            ElevatedButton(
              onPressed: () {
                print("ElevatedButton");
              },
              child: Text("ElevatedButton", style: TextStyle(fontSize: 24)),
              //Customer Button
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                //text color
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            //OutlinedButton là button có viền bao quanh,
            // không có màu nền, phù hợp cho hành động thay thế
            OutlinedButton(
              onPressed: () {
                print("OutlinedButton");
              },
              onLongPress: (){
                print("Long pressed");
              },

              // // khoa button
              // onPressed: null,
              child: Text("OutlinedButton", style: TextStyle(fontSize: 24),),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                //text color
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),

            SizedBox(height: 20),
            // InkWell
            // InkWell không phải là button,
            // nhưng nó cho phép tạo hiệu ứng gợn sóng (ripple effect)
            // khi nhấn vào bất kỳ widget nào.
            InkWell(
              onDoubleTap: () {
                print("InkWell is Pressed double");
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: Text("Option with Button"),
              ),
            ),
            SizedBox(height: 20),
            TextButton.icon(onPressed: (){},
                icon: Icon(Icons.favorite),
                label: Text("Yêu thích"))
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
