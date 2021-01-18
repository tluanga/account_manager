import 'package:account_manager/business_logic/models/ledger.models.dart';
import 'package:flutter/foundation.dart';

class LedgerViewModel extends ChangeNotifier {
  List<Ledger> ledgerTransactionList = [];

  void addLedgerTransaction(Ledger ledger) {
    ledgerTransactionList.add(ledger);
  }
}
