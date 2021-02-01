class PurchaseTransactionType {
  int id;
  String name;
  String description;
  int assetOrLiabilities; // 0--for buy 1-- sell
  int debitSideLedger;
  int creditSideLedger;
  int partyLedger;
  // 0 - when Incomplete and 1- when Complete

  PurchaseTransactionType(
      {this.name,
      this.description,
      this.assetOrLiabilities,
      this.debitSideLedger,
      this.creditSideLedger,
      this.partyLedger});
  PurchaseTransactionType.widthId(
      {this.id,
      this.name,
      this.description,
      this.assetOrLiabilities,
      this.debitSideLedger,
      this.creditSideLedger,
      this.partyLedger});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['description'] = description;
    map['assetOrLiabilities'] = assetOrLiabilities;
    map['debitSideLedger'] = debitSideLedger;
    map['creditSideLedger'] = creditSideLedger;
    map['partyLedger'] = partyLedger;

    return map;
  }

  factory PurchaseTransactionType.fromMap(Map<String, dynamic> map) {
    return PurchaseTransactionType.widthId(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      assetOrLiabilities: map['assetOrLiabilities'],
      debitSideLedger: map['debitSideLedger'],
      creditSideLedger: map['creditSideLedger'],
      partyLedger: map['partyLedger'],
    );
  }
}
