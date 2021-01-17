import 'package:flutter/material.dart';

class TransactionType extends ChangeNotifier {
  int id;
  String name;
  List<int> ledgers;
  TransactionType({this.id, this.name, this.ledgers});
}

class TransactionTypeList extends ChangeNotifier {
  List<TransactionType> transactionTypes = [];

  TransactionTypeList() {
    var t1 = new TransactionType(
      id: 1,
      name: 'Purchase of Machinery',
      ledgers: [1, 2],
    );
    var t2 = new TransactionType(
      id: 2,
      name: 'Purchase of Goods',
      ledgers: [3, 4],
    );
    this.transactionTypes.add(t1);
    this.transactionTypes.add(t2);
  }

  void addTransactionType(int id, String name, ledgers) {
    TransactionType _transactiontype;
    _transactiontype.id = id;
    _transactiontype.name = name;
    _transactiontype.ledgers = ledgers;
    transactionTypes.add(_transactiontype);
    ChangeNotifier();
  }
}
