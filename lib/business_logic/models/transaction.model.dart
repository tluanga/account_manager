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

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['amount'] = amount;
    map['particular'] = particular;
    map['date'] = date.toIso8601String();
    map['transactionTypeId'] = transactionTypeId;
    map['baOrBalo'] = baOrBalo;
    map['cashOrBank'] = cashOrBank;
    return map;
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction.withId(
      id: map['id'],
      amount: map['amount'],
      particular: map['particular'],
      date: DateTime.parse(map['date']),
      transactionTypeId: map['transactionTypeId'],
      baOrBalo: map['baOrBalo'],
      cashOrBank: map['cashOrBank'],
    );
  }
}
