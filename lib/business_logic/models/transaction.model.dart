class Transaction {
  int id;
  int amount;
  String particular;
  int isCredit; //user input
  int cashOrBank; //user input
  DateTime date; //user input
  int creditType; //BA partial or Full --user input
  int partyId; //user purchase is made by BA
  String partyName; //Computed
  int assetLedger; //if the purchase is of asset//user input
  String assetLedgerName;
  int transactionTypeId = 0;
  String transactionTypeName = ''; //user input
  int debitSideLedgerId; //computed-
  String debitSideLedgerName; //computed --
  int creditSideLedgerId;
  String creditSideLedgerName; //--compu
  int isReturn;
  Transaction(
      {this.amount,
      this.particular,
      this.isCredit,
      this.cashOrBank,
      this.date,
      this.creditType,
      this.partyId,
      this.partyName,
      this.assetLedger,
      this.transactionTypeId,
      this.transactionTypeName,
      this.debitSideLedgerId,
      this.debitSideLedgerName,
      this.creditSideLedgerId,
      this.creditSideLedgerName,
      this.isReturn});
  Transaction.withId({
    this.id,
    this.amount,
    this.particular,
    this.isCredit,
    this.cashOrBank,
    this.date,
    this.creditType,
    this.partyId,
    this.partyName,
    this.assetLedger,
    this.assetLedgerName,
    this.transactionTypeId,
    this.transactionTypeName,
    this.debitSideLedgerId,
    this.debitSideLedgerName,
    this.creditSideLedgerId,
    this.creditSideLedgerName,
    this.isReturn,
  });

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }

    map['amount'] = amount;
    map['particular'] = particular;
    map['isCredit'] = isCredit;
    map['cashOrBank'] = cashOrBank;
    map['date'] = date.microsecondsSinceEpoch;
    map['creditType'] = creditType;
    map['partyId'] = partyId;
    map['partyName'] = partyName;
    map['assetLedger'] = assetLedger;
    map['assetLedgerName'] = assetLedgerName;
    map['transactionTypeId'] = transactionTypeId;
    map['transactionTypeName'] = transactionTypeName;
    map['debitSideLedgerId'] = debitSideLedgerId;
    map['debitSideLedgerName'] = debitSideLedgerName;
    map['creditSideLedgerId'] = creditSideLedgerId;
    map['creditSideLedgerName'] = creditSideLedgerName;
    map['isReturn'] = isReturn;

    print('date value is');
    print(map['date']);
    print(map['date'].runtimeType);
    return map;
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction.withId(
      id: map['id'],
      amount: map['amount'],
      particular: map['particular'],
      isCredit: map['isCredit'],
      cashOrBank: map['cashOrBank'],
      date: DateTime.fromMicrosecondsSinceEpoch(map['date']),
      creditType: map['creditType'],
      partyId: map['partyId'],
      assetLedger: map['assetLedger'],
      assetLedgerName: map['assetLedgerName'],
      transactionTypeId: map['transactionTypeId'],
      transactionTypeName: map['transactionTypeName'],
      debitSideLedgerId: map['debitSideLedgerId'],
      debitSideLedgerName: map['debitSideLedgerName'],
      creditSideLedgerId: map['creditSideLedgerId'],
      creditSideLedgerName: map['creditSideLedgerName'],
      isReturn: map['isReturn'],
    );
  }
}
