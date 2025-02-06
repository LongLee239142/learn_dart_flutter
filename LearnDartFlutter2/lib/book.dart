class Book {
  //Khai báo các thuộc tính
  late String _name;
  late int year;

  //Khai báo hàm khởi tạo
  Book(this._name, this.year);

  Book.bookNew(String name) {
    this._name = name;
    this.year = 2025;
  }

  //Khai báo các phương thức
  String get getName => _name;

  set setName(String name) {
    _name = name;
  }

  void showHello() {
    print("Hello $_name");
  }
}
