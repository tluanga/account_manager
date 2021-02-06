import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/widgets.dart';

class AssetSelectViewModel extends ChangeNotifier {
  List<LedgerMaster> assetList = [];
  LedgerMaster selectedAsset;
  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();

  void loadData() async {
    assetList = await _ledgerMasterService.getList();
    notifyListeners();
  }

  // void printData() {
  //   String _length = assetList.length.toString();
  //   print('length of list $_length in printData');
  //   print(assetList.length.toString());
  // }

  void setFilteredData(String _searchString) async {
    assetList = await _ledgerMasterService.getFilteredAssetList(_searchString);
    // transactionTypeList.forEach((element) {
    //   String name = element.name;
    //   print('$name');
    // });
    notifyListeners();
  }

  void setSelectedAssetType(LedgerMaster _selectedAsset) {
    selectedAsset = _selectedAsset;
    notifyListeners();
  }
}
