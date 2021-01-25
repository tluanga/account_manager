class LedgerTransaction {
  LedgerTransaction({
    this.id,
    this.ledgerId,
    this.date,
    this.amount,
    this.particular,
    this.debitOrCredit,
    this.cashOrBank,
  });

  int id;
  int ledgerId;
  String date;
  int amount;
  String particular;
  int debitOrCredit;
  int cashOrBank;

  factory LedgerTransaction.fromMap(Map<String, dynamic> json) =>
      LedgerTransaction(
        id: json["id"],
        ledgerId: json["ledgerId"],
        date: json["date"],
        amount: json["amount"],
        particular: json["particular"],
        debitOrCredit: json["debitOrCredit"],
        cashOrBank: json["cashOrBank"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "ledgerId": ledgerId,
        "date": date,
        "amount": amount,
        "particular": particular,
        "debitOrCredit": debitOrCredit,
        "cashOrBank": cashOrBank,
      };
}
