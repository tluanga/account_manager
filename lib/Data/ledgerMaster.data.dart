import 'package:account_manager/business_logic/models/ledgermaster.models.dart';

class LedgerMasterData {
  List<LedgerMaster> ledgerMasterDataList = [
    LedgerMaster(id: 1, name: 'Cash Account'),
    LedgerMaster(id: 2, name: 'Machinery Account'),
    LedgerMaster(id: 3, name: 'Purchase Account'),
  ];

// --------Find ledgerMaster by Id---------
  LedgerMaster findLedgerMaster(int id) =>
      ledgerMasterDataList.firstWhere((element) => element.id == id);
}
