class PurchaseType {
  //1) Asset -Balo - Bank payment- DebitSide: Asset Account Credit Side:Bank
  static const int assetBaloBank = 1;

  //2) Asset -Balo - Cash payment- DebitSide: Asset Account Credit Side:Cash
  static const int assetBaloCash = 2;

  //3) Asset-Ba- Debit:Asset Account Credit: Party Ac
  static const int assetBa = 3;

  //4) Asset-Ba-Cash Partial Cash Payment- Debit:Asset Account Credit:Cash Credit:Party Ac
  static const int assetBaCashPartial = 4;

  //5) Asset-Ba-Bank Partial Cash Payment- Debit:Asset Account Credit:Cash Credit:Party Ac
  static const int assetBaBankPartial = 5;

  //6) non-Asset -Balo - Bank payment- DebitSide: Asset Account Credit Side:Bank
  static const int nonAssetBaloBank = 6;

  //7) Asset -Balo - Cash payment- DebitSide: Asset Account Credit Side:Cash
  static const int nonAssetBaloCash = 7;

  //8) Asset-Ba- Debit:Asset Account Credit: Party Ac
  static const int nonAssetBa = 8;

  //) Asset-Ba-Cash Partial Cash Payment- Debit:Asset Account Credit:Cash Credit:Party Ac
  static const int nonAssetBaCashPartial = 9;

  //10) Asset-Ba-Bank Partial Cash Payment- Debit:Asset Account Credit:Cash Credit:Party Ac
  static const int nonAssetBaBankPartial = 10;
}
