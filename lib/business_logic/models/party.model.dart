class Party {
  int id;
  String name;
  String description;
  Party({this.name, this.description});
  Party.withId({this.id, this.name, this.description});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }

    map['name'] = name;
    map['description'] = description;

    return map;
  }

  factory Party.fromMap(Map<String, dynamic> map) {
    return Party.withId(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }
}
