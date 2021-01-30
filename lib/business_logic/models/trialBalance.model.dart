class TrialBalance {
  int ledgerId;
  String ledgerName;
  int amount;

  TrialBalance({this.ledgerId, this.ledgerName, this.amount});

  factory TrialBalance.fromMap(Map<String, dynamic> map) {
    return TrialBalance(
      ledgerId: map['ledgerId'],
      ledgerName: map['ledgerName'],
      amount: map['amount'],
    );
  }
}
