class AccountingYear {
  int id;
  DateTime startDate;
  DateTime endDate;
  AccountingYear({this.startDate, this.endDate});
  AccountingYear.withId({this.id, this.startDate, this.endDate});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }

    map['startDate'] = startDate;
    map['endDate'] = endDate;

    return map;
  }

  factory AccountingYear.fromMap(Map<String, dynamic> map) {
    return AccountingYear.withId(
      id: map['id'],
      startDate: map['name'],
      endDate: map['description'],
    );
  }
}
