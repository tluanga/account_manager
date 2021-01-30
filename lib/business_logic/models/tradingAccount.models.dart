class TradingAccount {
  static int openingStock;
  int closingStock;
}

class DirectExpense {
  int ledgerId;
  int amount;
  String ledgerName;
  DirectExpense({this.ledgerId, this.ledgerName, this.amount});
}
