import 'package:account_manager/Data/ledgerMaster.data.dart';
import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:flutter/widgets.dart';

class LedgerMasterDashboardViewModel extends ChangeNotifier {
  // Instance of LedgerMasterData
  LedgerMasterService _ledgerMasterService = LedgerMasterService();
  List<LedgerMaster> ledgerMasterList = [];
  // Populate the list
  void loadData() {
    ledgerMasterList = _ledgerMasterData.ledgerMasterDataList;
    print(ledgerMasterList);
  }
}
