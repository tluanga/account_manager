import 'package:account_manager/Data/ledgerMaster.data.dart';
import 'package:account_manager/Data/transactionType.data.dart';
import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:flutter/foundation.dart';

class LedgerSelectViewModel extends ChangeNotifier {
  List<LedgerMaster> ledgerList = [];

  void loadData() {
    ledgerList = ledgerMasterDataList;
  }

  void selectLedgers(int ledgerId) {
    selectedLedgers.add(ledgerId);
  }
}
