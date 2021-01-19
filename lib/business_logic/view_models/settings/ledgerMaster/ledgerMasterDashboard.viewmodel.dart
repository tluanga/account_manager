import 'package:account_manager/Data/ledgerMaster.data.dart';
import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:flutter/widgets.dart';

class LedgerMasterDashboardViewModel extends ChangeNotifier {
  List<LedgerMaster> ledgerMasterList = [];
  // Populate the list
  void loadData() {
    ledgerMasterList = ledgerMasterDataList;
  }
}
