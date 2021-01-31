import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/foundation.dart';

class EditLedgerMasterViewModel extends ChangeNotifier {
  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();

  void updateLedgerMaster(LedgerMaster payload) async {
    _ledgerMasterService.update(payload);

    notifyListeners();
  }
}
