class LedgerMaster {
  int id;
  String name;
  String description;
  int directOrIndirect; // 0 -- for direct and 1-- for indirect
  int party; //0--for party and 1 non party

  bool active;
  LedgerMaster(
      {
      // this.id,
      this.name,
      this.description,
      this.active = true,
      this.directOrIndirect,
      this.party});
  LedgerMaster.withId(
      {this.id,
      this.name,
      this.description,
      this.directOrIndirect,
      this.party});

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
    map['directOrIndirect'] = directOrIndirect;
    map['party'] = party;

    return map;
  }

  factory LedgerMaster.fromMap(Map<String, dynamic> map) {
    return LedgerMaster.withId(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      directOrIndirect: map['directOrIndirect'],
      party: map['party'],
    );
  }
}
