class Transaction {
  int id;
  double amount;
  String particular;
  DateTime date;
  int mode; //0-leina, 1-hralna
  int transactionTypeId;
  int baOrPektlak; // 0 for ba -1 for pektlak
  int cashOrBank; //0 for cash - 1 for bank-2 for credit
  Transaction(
      {this.id,
      this.amount,
      this.particular,
      this.date,
      this.mode,
      this.transactionTypeId,
      this.baOrPektlak,
      this.cashOrBank});
}
