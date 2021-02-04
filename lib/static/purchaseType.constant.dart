class PurchaseType {
  //1) Asset-CashDown-Cash - Bank payment-
  //DebitSide: assetname
  //Credit Side:bank A/c
  static const int assetCashDownBank = 1;

  //2) Asset-CashDown-Bank - Bank payment-
  //DebitSide: assetName
  //Credit Side:Cash A/C76
  static const int assetCashDownCash = 2;

  //3) Asset-Credit
  //Debit:AssetName Ac
  //CreditSide: party Ac
  static const int assetDebt = 3;

  //4) Asset-Credit-Partial-Cash Partial Cash Payment-
  //Debit:Asset Account
  //Credit:Cash
  //Credit:Party Ac
  static const int assetDebtPartialCash = 4;

  //5) Asset-Credit-Partial-Bank Partial Cash Payment-
  //Debit:Asset Account
  //Credit:Bank
  //Credit:Party Ac
  static const int assetDebtPartialBank = 5;

  //6) Non-Asset-CashDown - Bank payment-
  //DebitSide: Purchases Account
  //Credit Side:Bank
  static const int nonAssetCashDownBank = 6;

  //7) Non-Asset-Cashdown-Cash-
  //DebitSide: Puchases Account
  //Credit Side:Cash
  static const int nonAssetCashDownCash = 7;

  //8) Non-Asset-Credit-
  //Debit:Purchases
  //Credit: Party Ac
  static const int nonAssetDebt = 8;

  //9) Non-Asset-Credit-Cash Partial Cash Payment-
  //Debit:Purchases Account
  //Credit:Cash
  //Credit:Party Ac
  static const int nonAssetDebtCashPartial = 9;

  //10) Non-Asset-Ba-Bank Partial Cash Payment-
  //Debit:Purchases Account
  //Credit:BAnk
  //Credit:Party Ac
  static const int nonAssetDebtBankPartial = 10;
}
