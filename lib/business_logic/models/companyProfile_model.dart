class Company {
  int id;
  String name;
  String address;
  String city;
  String state;
  String country;
  String email;
  String gstTin;
  int phoneNumber; // 0 - Incomplete, 1 - Complete

  Company(
      {this.name,
      this.address,
      this.city,
      this.state,
      this.country,
      this.email,
      this.gstTin,
      this.phoneNumber});
  Company.withId(
      {this.id,
      this.name,
      this.address,
      this.city,
      this.state,
      this.country,
      this.email,
      this.gstTin,
      this.phoneNumber});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['address'] = address;
    map['city'] = city;
    map['state'] = state;
    map['country'] = country;
    map['email'] = email;
    map['gstTin'] = gstTin;
    map['phoneNumber'] = phoneNumber;
    return map;
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company.withId(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      city: map['city'],
      state: map['state'],
      country: map['country'],
      email: map['email'],
      gstTin: map['gstTin'],
      phoneNumber: map['phoneNumber'],
    );
  }
}
