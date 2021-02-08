import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/party/party.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/widgets.dart';

class PartySelectViewModel extends ChangeNotifier {
  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();
  PartyService _partyService = serviceLocator<PartyService>();
  List<LedgerMaster> partyList;
  LedgerMaster _selectedParty;

  bool isLoading;

  void loadData() async {
    isLoading = true;
    partyList = await _ledgerMasterService.getPartyList();
    isLoading = false;
    print('loading party data');
    notifyListeners();
  }

  //--------get and set of _selectedParty
  LedgerMaster getSelectedParty() => _selectedParty;
  void setSelectedParty(LedgerMaster _party) {
    _selectedParty = _party;
    print(_selectedParty.name);
    notifyListeners();
  }

  //-------Get filtered Data for Search
  void getFilteredData(String _searchString) async {
    partyList =
        await _ledgerMasterService.getFilterdPartyLedgerList(_searchString);
    notifyListeners();
  }

  void saveData() {
    _partyService.setSelectedParty(_selectedParty);
    clearState();
  }

  void clearState() {
    partyList = null;
    _selectedParty = null;
  }
}
