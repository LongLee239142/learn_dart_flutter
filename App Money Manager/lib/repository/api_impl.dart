import 'package:appmoneymanager/models/login.dart';

import 'package:appmoneymanager/models/transaction.dart';

import 'api.dart';
import 'log.dart';

class ApiImpl implements Api {
  Log log;

  final List<Transaction> _data = [
    Transaction(
      dateTime: "2025-09-25 09:00:00",
      title: "Mua cà phê sáng",
      content: "Mua 1 ly cà phê sữa đá",
      amount: 35000,
    )
  ];

  ApiImpl(this.log) {
    _data.sort((a, b) => b.dateTime.compareTo(a.dateTime));
  }

  Future<void> delay() async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Future<void> addTransaction(Transaction transaction) async {
    delay();
    for (int i = 0; i < _data.length; i++) {
      if (_data[i].dateTime == transaction.dateTime)
        throw Exception("Duplicate datetime");
    }
    _data.add(transaction);
    _data.sort((a, b) => b.dateTime.compareTo(a.dateTime));
  }

  @override
  Future<bool> checkLogin(Login login) async {
    delay();
    if (login.username == "1" && login.password == "1") {
      return Future(() => true);
    }
    return Future(() => false);
  }

  @override
  Future<void> deleteTransaction(String dateTime) async {
    delay();
    for (int i = 0; i < _data.length; i++) {
      if (_data[i].dateTime == dateTime) {
        _data.removeAt(i);
        return;
      }
    }
    throw Exception("Not found data");
  }

  @override
  Future<void> editTransaction(Transaction transaction) async {
    delay();
    for (int i = 0; i < _data.length; i++) {
      if (_data[i].dateTime == transaction.dateTime) {
        _data[i] = transaction;
        _data.sort((a, b) => b.dateTime.compareTo(a.dateTime));
        return;
      }
    }
    throw Exception("Not found data");
  }

  @override
  Future<List<String>> getMonths() async {
    delay();
    Set<String> listMonth = {};
    for (int i = 0; i < _data.length; i++) {
      var tmp = "${_data[i].dateTime.substring(0, 7)}-01 00:00:00";
      listMonth.add(tmp);
    }
    return listMonth.toList();
  }

  @override
  Future<double> getTotal() async {
    delay();
    double total = 0;
    for (int i = 0; i < _data.length; i++) {
      total += _data[i].amount;
    }
    return total;
  }

  @override
  Future<List<Transaction>> getTransaction(String month) async {
    delay();
    List<Transaction> listTransaction = [];

    for (int i = 0; i < _data.length; i++) {
      var tmp = _data[i].dateTime.substring(0, 7);
      if (month.startsWith(tmp)) {
        listTransaction.add(_data[i]);
      }
    }
    return listTransaction;
  }
}
