import 'package:intl/intl.dart';

class Transaction {
  int id;
  int amount;
  String particular;
  DateTime date;
  int transactionTypeId;
  int baOrBalo; // 0 for ba -1 for pektlak
  int cashOrBank; //0 for cash - 1 for bank-2 for credit
  Transaction(
      {
      //this.id,
      this.amount,
      this.particular,
      this.date,
      this.transactionTypeId,
      this.baOrBalo,
      this.cashOrBank});
  Transaction.withId(
      {this.id,
      this.amount,
      this.particular,
      this.date,
      this.transactionTypeId,
      this.baOrBalo,
      this.cashOrBank});
  var format = new DateFormat("yMd");
  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    var _date = date;
    var __date = format.format(date);
    map['amount'] = amount;
    map['particular'] = particular;
    map['date'] = date;
    // map['date'] = date.microsecondsSinceEpoch;
    map['transactionTypeId'] = transactionTypeId;
    map['baOrBalo'] = baOrBalo;
    map['cashOrBank'] = cashOrBank;
    print('date value is');
    print(map['date']);
    print(map['date'].runtimeType);
    return map;
  }

  // var format = new DateFormat("yMd");
  // var dateString = format.format(date);
  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction.withId(
      id: map['id'],
      amount: map['amount'],
      particular: map['particular'],
      // date: map['date'],
      date: DateTime.fromMicrosecondsSinceEpoch(map['date']),
      transactionTypeId: map['transactionTypeId'],
      baOrBalo: map['baOrBalo'],
      cashOrBank: map['cashOrBank'],
    );
  }
}
