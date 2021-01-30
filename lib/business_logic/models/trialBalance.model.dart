class TrialBalance {
  int ledgerId;
  int amount;

  TrialBalance({this.ledgerId, this.amount});

  factory TrialBalance.fromMap(Map<String, dynamic> map) {
    return TrialBalance(
      ledgerId: map['ledgerId'],
      amount: map['amount'],
    );
  }
}
