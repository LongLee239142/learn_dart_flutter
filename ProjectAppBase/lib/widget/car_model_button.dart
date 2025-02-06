import 'package:flutter/material.dart';

class ModelButton extends StatelessWidget {
  String textValue = "";
  final Function addTask;

  ModelButton({
    super.key,
    required this.addTask
  });

  TextEditingController controller = TextEditingController();

  void handlerOnClick(BuildContext context) {
    final name = controller.text;
    if(name.isEmpty){
      return;
    }
    addTask(name);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery
          .of(context)
          .viewInsets,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
           controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Your task",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: ()=> handlerOnClick(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Màu nền của button
                  foregroundColor: Colors.white, // Màu chữ (text)
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Bo góc
                  ),
                ),
                child: Text('Add Task'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
