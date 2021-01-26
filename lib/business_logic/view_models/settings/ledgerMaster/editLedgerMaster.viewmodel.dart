import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/foundation.dart';

class EditLedgerMasterViewModel extends ChangeNotifier {
  LedgerMaster ledgerMasterForUpdate;
  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();

  void editLedgerMaster() async {
    var result = await _ledgerMasterService.update(ledgerMasterForUpdate);
  }
}
