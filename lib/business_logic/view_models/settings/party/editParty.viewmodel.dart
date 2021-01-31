import 'package:account_manager/business_logic/models/party.model.dart';
import 'package:account_manager/services/party/party.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/foundation.dart';

class EditPartyViewModel extends ChangeNotifier {
  PartyService _partyService = serviceLocator<PartyService>();

  void updateLedgerMaster(Party payload) async {
    var result = await _partyService.update(payload);
    print(payload.name);
    print(payload.description);
    notifyListeners();
  }
}
