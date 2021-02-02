class SalesType {
  //1) BaloCash - Bank payment- DebitSide: Cash Credit Side:sales A/c
  static const int baLo = 1;

  //2) Balo Bank - Bank payment- DebitSide: Bank Account Credit Side:Sales A/C
  static const int baloBank = 2;

  //3) Ba Debit:Party Ac DebitSide: party Ac creditSide: Sales A/c
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
