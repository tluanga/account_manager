class LedgerTransaction {
  int id;
  int ledgerId;
  DateTime date;
  int amount;
  String particular;
  int debitOrCredit; // 0--debit, 1--credit
  int cashOrBank; //0- cash, 1 --- bank
  LedgerTransaction({
    this.id,
    this.amount,
    this.ledgerId,
    this.particular,
    this.date,
    this.debitOrCredit,
    this.cashOrBank,
  });
}
