import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/widgets.dart';

import '../../../../services/ledgerMaster/ledgeMaster.service.dart';

import '../../../models/ledgermaster.models.dart';

class AssetSelectViewModel extends ChangeNotifier {
  List<LedgerMaster> assetList;
  LedgerMaster selectedAsset;
  LedgerMasterService _ledgerMasterService =
      serviceLocator<LedgerMasterService>();
  bool isLoading;

  void loadData() async {
    isLoading = true;
    assetList = await _ledgerMasterService.getAssetLedgerList();
    isLoading = false;
    notifyListeners();
  }

  void setFilteredData(String _searchString) async {
    assetList =
        await _ledgerMasterService.getFilteredAssetLedgerList(_searchString);

    notifyListeners();
  }

  void setSelectedAsset(LedgerMaster _asset) {
    selectedAsset = _asset;
    notifyListeners();
  }
}
