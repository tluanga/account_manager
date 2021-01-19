import 'package:account_manager/models/entities/ledgermaster.dart';
import 'package:flutter/foundation.dart';

class LedgerMasterModel extends ChangeNotifier {
  List<LedgerMaster> ledgerMasterList = [
    LedgerMaster(id: 1, name: 'Cash Account', ledgerType: 1),
  ];

  void addLedgerMaster(LedgerMaster ledgerMaster) {
    ledgerMasterList.add(ledgerMaster);
  }
}
