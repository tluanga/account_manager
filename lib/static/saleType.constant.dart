class SaleType {
  //1) Sale -Balo - Bank payment-
  //DebitSide: Bank Account
  //Credit Side:Sales Ac
  static const int saleCashDownBank = 1;

  //2) Sale -Balo - Cash payment-
  //DebitSide: Cash Account
  //Credit Side:Sales Ac
  static const int saleCashDownCash = 2;

  //3) Sale -Ba- -
  //DebitSide: Party Ac
  //Credit Side:Sales
  static const int saleDebt = 3;

  //4) Sale-Ba-Partial Paymen Bank
  //Debit:Bank   Debit:Party   Account
  //Credit: Sales
  static const int saleBaPartialBank = 4;

  //5) Sale-Ba-Partial Payment-Ba-Cash Partial Cash Payment-
  // Debit:Bank Debit Party Credit:Sales
  static const int saleBaPartialCash = 5;
}
