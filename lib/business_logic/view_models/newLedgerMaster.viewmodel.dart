import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:flutter/foundation.dart';

class NewLedgerMasterViewModel extends ChangeNotifier {
  List<LedgerMaster> _ledgerMasters = [];

  void loadData() async {
    notifyListeners();
  }
}
