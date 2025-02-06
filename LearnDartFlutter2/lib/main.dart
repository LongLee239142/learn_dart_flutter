import 'package:learndartflutter2/book.dart';

main() {
  var MyBook = Book("KhoaHoc", 2023);
  var YourBook = Book.bookNew("LichSu");
  MyBook.showHello();
  MyBook.setName = "ToanHoc";
  print(MyBook.getName);
  print(YourBook.year);
}
