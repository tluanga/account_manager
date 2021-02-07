import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/widgets.dart';

import '../../../../services/ledgerMaster/ledgeMaster.service.dart';

import '../../../models/ledgermaster.models.dart';

class AssetSelectViewModel extends ChangeNotifier {
  List<LedgerMaster> partyList;
  LedgerMaster selectedParty;
  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();
  bool isLoading;

  void loadData() async {
    isLoading = true;
    partyList = await _ledgerMasterService.getPartyList();
    isLoading = false;
    notifyListeners();
  }

  void printData() {
    String _length = partyList.length.toString();
    print('length of list $_length in printData');
  }

  void setFilteredData(String _searchString) async {
    partyList =
        await _ledgerMasterService.getFilterdPartyLedgerList(_searchString);
    // transactionTypeList.forEach((element) {
    //   String name = element.name;
    //   print('$name');
    // });
    notifyListeners();
  }

  void loadTransactionType() async {
    partyList = await _ledgerMasterService.getList();
    notifyListeners();
  }

  void setSelectedParty(LedgerMaster _party) {
    selectedParty = _party;
    notifyListeners();
  }

  // ignore: missing_return

}
