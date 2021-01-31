class TradingAccount {
  static int openingStock;
  int closingStock;
}

class DirectExpense {
  int ledgerId;
  String name;
  int amount;
  int date;
  String particular;
  int debitOrCredit;
  int cashOrBank;
  int directOrIndirect;
  int party;

  DirectExpense(
      {this.ledgerId,
      this.name,
      this.amount,
      this.date,
      this.particular,
      this.debitOrCredit,
      this.cashOrBank,
      this.directOrIndirect,
      this.party});
  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    // if (id != null) {
    //   map['id'] = id;
    // }
    map['ledgerId'] = ledgerId;
    map['name'] = name;
    map['amount'] = amount;
    map['date'] = date;
    map['debitOrCredit'] = debitOrCredit;
    map['cashOrBank'] = cashOrBank;
    map['directOrIndirect'] = directOrIndirect;
    map['party'] = party;

    return map;
  }

  factory DirectExpense.fromMap(Map<String, dynamic> map) {
    return DirectExpense(
      ledgerId: map['ledgerId'],
      name: map['name'],
      amount: map['amount'],
      date: map['date'],
      particular: map['particular'],
      debitOrCredit: map['debitOrCredit'],
      cashOrBank: map['cashOrBank'],
      directOrIndirect: map['directOrIndirect'],
      party: map['party'],
    );
  }
}
