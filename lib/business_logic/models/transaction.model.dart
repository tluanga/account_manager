class Transaction {
  int id;
  double amount;
  DateTime date;
  int mode; //0-leina, 1-hralna
  int transactionTypeId;
  int baOrPektlak; // 0 for ba -1 for pektlak
  int cashOrBank; //0 for cash - 1 for bank
  Transaction({this.id, this.amount, this.transactionTypeId, this.baOrPektlak});
}
