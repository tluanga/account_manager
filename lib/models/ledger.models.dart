class Ledger {
  int id;
  int ledgerMasterId;
  double amount;
  int debitOrCredit; //0--debit--1 for credit
  Ledger({this.id, this.ledgerMasterId, this.amount, this.debitOrCredit});
}
