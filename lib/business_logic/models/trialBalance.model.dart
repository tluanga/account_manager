class TrialBalance {
  int ledgerId;
  String ledgerName;
  int amount;
  int debitOrCredit;

  TrialBalance({
    this.ledgerId,
    this.ledgerName,
    this.amount,
    this.debitOrCredit,
  });

  factory TrialBalance.fromMap(Map<String, dynamic> map) {
    return TrialBalance(
      ledgerId: map['ledgerId'],
      ledgerName: map['ledgerName'],
      amount: map['amount'],
      debitOrCredit: map['debitOrCredit'],
    );
  }
}
