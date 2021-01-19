class LedgerTransaction {
  int id;
  int ledgerId;
  DateTime date;
  int amount;
  int debitOrCredit; // 0--debit, 1--credit
  LedgerTransaction({this.id, this.ledgerId, this.date, this.debitOrCredit});
}
