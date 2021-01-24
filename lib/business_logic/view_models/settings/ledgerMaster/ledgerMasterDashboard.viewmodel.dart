import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/database/databaseHelper.service.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/widgets.dart';

class LedgerMasterDashboardViewModel extends ChangeNotifier {
  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();

  List<LedgerMaster> ledgerMasterList = [];

  // Populate the list
  void loadData() async {
    // final _ledgerMasterList = await _ledgerMasterService.getLedgerMasterList();
    // ledgerMasterList = _ledgerMasterList;

    notifyListeners();
  }
}
