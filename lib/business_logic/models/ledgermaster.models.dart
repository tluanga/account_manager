class LedgerMaster {
  int id;
  String name;
  String description;

  bool active;
  LedgerMaster({
    // this.id,
    this.name,
    this.description,
    this.active = true,
  });
  LedgerMaster.withId({this.id, this.name, this.description});

  setActive() {
    active = !active;
  }

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['description'] = description;
    return map;
  }

  factory LedgerMaster.fromMap(Map<String, dynamic> map) {
    return LedgerMaster.withId(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }
}
