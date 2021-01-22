class LedgerMaster {
  int id;
  String name;
  String description;

  bool active;
  LedgerMaster({
    this.id,
    this.name,
    this.description,
    this.active = true,
  });

  setActive() {
    active = !active;
  }
}
