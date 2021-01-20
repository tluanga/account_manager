import 'package:account_manager/business_logic/models/ledgermaster.models.dart';

List<LedgerMaster> ledgerMasterDataList = [
  LedgerMaster(id: 1, name: 'Cash Account', ledgerType: 1),
  LedgerMaster(id: 2, name: 'Machinery Account', ledgerType: 2),
  LedgerMaster(id: 3, name: 'Purchase Account', ledgerType: 3),
];

// --------Find ledgerMaster by Id---------
LedgerMaster findLedgerMaster(int id) =>
    ledgerMasterDataList.firstWhere((element) => element.id == id);
