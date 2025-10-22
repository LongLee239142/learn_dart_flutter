import 'package:flutter/material.dart';
class Mytext extends StatelessWidget {
  const Mytext({super.key});

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
            //Tao khoang cach
            const SizedBox(height: 50,),
            //Text co ban
            const Text("Long Lee"),
            const SizedBox(height: 20,),
            
            const Text(
                "Hello everyone is learning flutter !",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                letterSpacing: 1.5,

              ),
            ),
            const SizedBox(height: 20,),
            const Text(
              "Flutter là một framework mã nguồn mở do Google phát triển, cho phép lập trình viên tạo ứng dụng mobile cho cả Android và iOS chỉ với một codebase duy nhất. Nhờ khả năng tối ưu hiệu năng, giao diện đẹp và thời gian phát triển nhanh chóng, Flutter ngày càng được ưa chuộng trong cộng đồng lập trình. Trong bài viết này, mình sẽ cùng bạn khám phá khái niệm Flutter, các thành phần chính và lý do vì sao đây là công cụ lý tưởng cho lập trình viên.",
              textAlign: TextAlign.center,
              maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blue

              ),
            )
          ]
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