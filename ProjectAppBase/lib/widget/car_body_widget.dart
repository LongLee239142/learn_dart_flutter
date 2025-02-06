import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

import '../model/Items.dart';

class boxContainer extends StatelessWidget {
  final DataItems item;
  double index;
  final Function handlerDelete;

  boxContainer(
      {super.key,
      required this.item,
      required this.handlerDelete,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: (index % 2 == 0)
            ? Color.fromARGB(255, 130, 192, 239)
            : Color.fromARGB(100, 159, 159, 80),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: TextStyle(
                  fontSize: 20,
                  color: const Color(0xff4B4B4B),
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
                onTap: () async {
                  if (await confirm(context)) {
                    handlerDelete(item.id);
                    return print('pressedOK');
                  }
                  return print("pressCancel");
                },
                child:
                    Icon(Icons.delete_outline, color: const Color(0xff4B4B4B))),
          ],
        ),
      ),
    );
  }
}
