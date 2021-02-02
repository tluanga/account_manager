class PurchaseType {
  //1) BaloCash - Bank payment- DebitSide: Cash Credit Side:sales A/c
  static const int cashDownBank = 1;

  //2) Balo Bank - Bank payment- DebitSide: Bank Account Credit Side:Sales A/C
  static const int cashDownCash = 2;

  //3) Ba Debit:Party Ac DebitSide: party Ac creditSide: Sales A/c
  static const int assetDebt = 3;

  //4) Asset-Ba-Cash Partial Cash Payment- Debit:Asset Account Credit:Cash Credit:Party Ac
  static const int assetDebtCashPartial = 4;

  //5) Asset-Ba-Bank Partial Cash Payment- Debit:Asset Account Credit:Cash Credit:Party Ac
  static const int assetDebtBankPartial = 5;

  //6) non-Asset -Balo - Bank payment- DebitSide: Asset Account Credit Side:Bank
  static const int nonAssetCashDownBank = 6;

  //7) Asset -Balo - Cash payment- DebitSide: Asset Account Credit Side:Cash
  static const int nonAssetCashDownCash = 7;

  //8) Asset-Ba- Debit:Asset Account Credit: Party Ac
  static const int nonAssetDebt = 8;

  //) Asset-Ba-Cash Partial Cash Payment- Debit:Asset Account Credit:Cash Credit:Party Ac
  static const int nonAssetDebtCashPartial = 9;

  //10) Asset-Ba-Bank Partial Cash Payment- Debit:Asset Account Credit:Cash Credit:Party Ac
  static const int nonAssetDebtBankPartial = 10;
}
