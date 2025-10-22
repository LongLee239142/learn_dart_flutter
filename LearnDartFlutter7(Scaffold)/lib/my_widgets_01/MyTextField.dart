import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

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

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child:Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your name",
                  border: OutlineInputBorder(),

                ),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "user@gmail.com",
                  helperText: "Enter your email",
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(Icons.clear),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  filled: true,
                  fillColor: Colors.lightBlueAccent
                ),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: "Phone number",
                  hintText: "Enter your phone number",
                  border: OutlineInputBorder(
                  )
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                    labelText: "Dob",
                    hintText: "Enter your date of birth",
                    border: OutlineInputBorder(
                    )
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    border: OutlineInputBorder(
                    )
                ),
                obscureText: true,
                obscuringCharacter: '*',
              ),
              SizedBox(height: 30),
              TextField(
                onChanged: (value){
                  print('Dang nhap: $value');
                },
                onSubmitted: (value){
                  print('Da hoan thanh noi dung : $value');
                },
                decoration: InputDecoration(
                    labelText: "Secret Question",
                    border: OutlineInputBorder(
                    )
                ),
              ),
            ],
          ),
        ) ,
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
