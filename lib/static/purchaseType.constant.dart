class PurchaseType {
  //1) BaloCash - Bank payment- DebitSide: assetname Credit Side:bank A/c
  static const int assetCashDownBank = 1;

  //2) Balo Bank - Bank payment- DebitSide: assetName Credit Side:Cash A/C
  static const int assetCashDownCash = 2;

  //3) Ba  Debit:AssetName Ac VreditSide: party Ac
  static const int assetDebt = 3;

  //4) Asset-Ba-Cash Partial Cash Payment- Debit:Asset Account Credit:Cash Credit:Party Ac
  static const int assetDebtCashPartial = 4;

  //5) Asset-Ba-Bank Partial Cash Payment- Debit:Asset Account Credit:Bank Credit:Party Ac
  static const int assetDebtBankPartial = 5;

  //6) non-Asset -Balo - Bank payment- DebitSide: Purchases Account Credit Side:Bank
  static const int nonAssetCashDownBank = 6;

  //7) Asset -Balo - Cash payment- DebitSide: Puchases Account Credit Side:Cash
  static const int nonAssetCashDownCash = 7;

  //8) Asset-Ba- Debit:Purchases Credit: Party Ac
  static const int nonAssetDebt = 8;

  //) Asset-Ba-Cash Partial Cash Payment- Debit:Purchases Account Credit:Cash Credit:Party Ac
  static const int nonAssetDebtCashPartial = 9;

  //10) Asset-Ba-Bank Partial Cash Payment- Debit:Purchases Account Credit:BAnk Credit:Party Ac
  static const int nonAssetDebtBankPartial = 10;
}
