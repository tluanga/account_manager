import 'package:flutter/foundation.dart';

import '../../../../services/ledgerMaster/ledgeMaster.service.dart';
import '../../../../services/serviceLocator.dart';
import '../../../../static/constants.dart';
import '../../../models/ledgermaster.models.dart';

class NewAssetViewModel extends ChangeNotifier {
  String _name = '';
  String _description = '';

  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();

  void newAssetLedger() async {
    LedgerMaster _payload = LedgerMaster(
      name: _name,
      description: _description,
      party: cNotPartyAc,
      asset: cASSET,
    );
    print('new Asset Creation');
    notifyListeners();
    await _ledgerMasterService.insert(_payload);
  }

  void setName(value) {
    _name = value;
    notifyListeners();
  }

  void setDescription(value) {
    _description = value;
    notifyListeners();
  }
}
