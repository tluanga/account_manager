import 'package:account_manager/Data/ledgerMaster.data.dart';
import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:flutter/foundation.dart';

class NewLedgerMasterViewModel extends ChangeNotifier {
  // Instance of ledger Master data
  LedgerMasterData _ledgerMasterData;
  void newLedgerMaster(LedgerMaster ledgerMaster) {
    _ledgerMasterData.ledgerMasterDataList.add(ledgerMaster);
  }
}
