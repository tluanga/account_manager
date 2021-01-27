class LedgerTransaction {
  int id;
  int ledgerId;
  int amount;
  String particular;
  DateTime date;
  int debitOrCredit; // 0 for debit -1 for credit
  int cashOrBank; //0 for cash - 1 for bank-2 for credit
  LedgerTransaction({
    //this.id,
    this.ledgerId,
    this.amount,
    this.particular,
    this.date,
    this.debitOrCredit,
    this.cashOrBank,
  });
  LedgerTransaction.withId({
    this.id,
    this.ledgerId,
    this.amount,
    this.particular,
    this.date,
    this.debitOrCredit,
    this.cashOrBank,
  });

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['amount'] = amount;
    map['particular'] = particular;
    map['date'] = date.microsecondsSinceEpoch;
    map['ledgerId'] = ledgerId;
    map['debitOrCredit'] = debitOrCredit;
    map['cashOrBank'] = cashOrBank;
    print('date value is');
    print(map['date']);
    print(map['date'].runtimeType);
    return map;
  }

  factory LedgerTransaction.fromMap(Map<String, dynamic> map) {
    return LedgerTransaction.withId(
      id: map['id'],
      amount: map['amount'],
      particular: map['particular'],
      date: DateTime.fromMicrosecondsSinceEpoch(map['date']),
      ledgerId: map['ledgerId'],
      debitOrCredit: map['debitOrCredit'],
      cashOrBank: map['cashOrBank'],
    );
  }
}
