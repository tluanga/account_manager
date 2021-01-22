class LedgerMaster {
  int id;
  String name;

  bool active;
  LedgerMaster({
    this.id,
    this.name,
    this.active = true,
  });

  setActive() {
    active = !active;
  }
}
