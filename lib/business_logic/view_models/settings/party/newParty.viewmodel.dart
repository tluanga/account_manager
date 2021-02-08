import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/business_logic/view_models/settings/party/partySelect.viewmodel.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/static/constants.dart';
import 'package:flutter/foundation.dart';

class NewPartyViewModel extends ChangeNotifier {
  String _name = '';
  String _description = '';

  PartySelectViewModel _partySelectViewModel =
      serviceLocator<PartySelectViewModel>();
  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();

  void newPartyLedger() async {
    LedgerMaster _payload = LedgerMaster(
      name: _name,
      description: _description,
      party: cPartyAc,
      asset: cNonASSET,
    );

    await _ledgerMasterService.insert(_payload);
    _partySelectViewModel.partyList.add(_payload);
    notifyListeners();
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
