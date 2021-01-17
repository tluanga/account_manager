import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:flutter/foundation.dart';

class LedgerMasterViewModel extends ChangeNotifier {
  List<LedgerMaster> ledgerMasterList = [
    LedgerMaster(id: 1, name: 'Cash Account'),
    LedgerMaster(id: 2, name: 'Machinery Account'),
    LedgerMaster(id: 3, name: 'Purchase Account'),
  ];
  void newLedgerMaster(LedgerMaster ledgerMaster) {
    ledgerMasterList.add(ledgerMaster);
  }

  void removeLedgerMaster(int id) {
    // find the leger Master to remove

    // ledgerMasterList.remove(value)
  }
  void findLedgerMasterList(int id) {
    ledgerMasterList.where((element) => false);
  }
}
