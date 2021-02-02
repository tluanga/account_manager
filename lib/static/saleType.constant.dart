class SaleType {
  //1) Sale -Balo - Bank payment- DebitSide: Asset Account Credit Side:Bank
  static const int saleBaloBank = 1;

  //2) Sale -Balo - Cash payment- DebitSide: Asset Account Credit Side:Bank
  static const int saleBaloCash = 2;

  //3) Sale -Ba- - DebitSide: Asset Account Credit Side:Cash
  static const int saleBa = 2;

  //4) Sale-Ba-Partial Paymen Bank Debit:Asset Account Credit: Party Ac
  static const int saleBaPartialBank = 3;

  //5) Sale-Ba-Partial Payment-Ba-Cash Partial Cash Payment- Debit:Asset Account Credit:Cash Credit:Party Ac
  static const int assetBaPartialCash = 4;
}
