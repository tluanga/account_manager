import 'package:account_manager/Data/ledgerMaster.data.dart';
import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:flutter/foundation.dart';

class NewLedgerMasterViewModel extends ChangeNotifier {
  void newLedgerMaster(LedgerMaster ledgerMaster) {
    ledgerMasterDataList.add(ledgerMaster);
  }
}
