import 'book.dart';

main() {
  // String name = "Long Lee";
  // int age = 12;
  // bool old = true;
  // dynamic all;
  // print(age);
  // print(name);
  // print(old);
  // print(all);

  //List,Map
  // List name = ['Huy','Long',23];
  // print(name);
  // print(name[2]);

  // Map<String, int> obj = {"class": 1, "class1": 2, "class2": 3};
  // print(obj["class1"]);
  // print(obj);
  // //hang so dung const or final
  // // const TIME = 1;
  // final TIME = 1;
  // print(TIME);

  var MyBook = Book('Thoi Trang', 2026);
  print(MyBook.name);
  print(MyBook.year);
}
