class TransactionType {
  int id;
  String name;
  String description;
  List<int> ledger;

  // 0 - when Incomplete and 1- when Complete

  TransactionType({this.name, this.description, this.ledger});
  TransactionType.widthId({this.id, this.name, this.description, this.ledger});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['description'] = description;

    return map;
  }

  factory TransactionType.fromMap(Map<String, dynamic> map) {
    return TransactionType.widthId(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }
}
