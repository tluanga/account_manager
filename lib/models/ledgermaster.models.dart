class LedgerMaster {
  int id;
  String name;
  int ledgerType;
  bool active;
  LedgerMaster({
    this.id,
    this.name,
    this.ledgerType,
    this.active = true,
  });

  setActive() {
    active = !active;
  }
}
