import 'package:account_manager/business_logic/models/party.model.dart';
import 'package:account_manager/services/party/party.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/foundation.dart';

class NewPartyViewModel extends ChangeNotifier {
  PartyService _partyService = serviceLocator<PartyService>();

  void newParty(Party data) async {
    print('NEW PARTY ENTRY');
    print(data.name);
    var _data = await _partyService.insert(data);
    String id = _data.toString();
    print('Newly entered data is $id');
    notifyListeners();
  }

  void updateParty(Party data) async {
    var _data = await _partyService.update(data);

    print(
      _data.toString(),
    );
    notifyListeners();
  }

  getParty() async {
    var _data = await _partyService.getList();

    // Company _temp = Company(name: 'test');
    // var _result = await _companyProfileService.insert(_temp);
    // print(_result.toString());
    print(
      _data.toString(),
    );
    notifyListeners();
  }
}
