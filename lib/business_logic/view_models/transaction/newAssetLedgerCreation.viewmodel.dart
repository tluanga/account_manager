import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/static/constants.dart';
import 'package:flutter/foundation.dart';

class NewAssetLedgerCreationViewModel extends ChangeNotifier {
  String name;
  String description;
  int directOrIndirect; // 0 -- for direct and 1-- for indirect
  int party = cNotPartyAc; //0--for party and 1 non party
  int asset = cASSET;

  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();

  Future<int> newAssetLedger() async {
    int result = await _ledgerMasterService.insert(LedgerMaster(
      name: name,
      description: description,
      directOrIndirect: directOrIndirect,
      party: party,
      asset: asset,
    ));
    return result;
  }

  void setName(String _name) {
    name = _name;
  }

  void setDescription(String _description) {
    description = _description;
  }
}

// all assets te hi fix asset vek an ni em?
