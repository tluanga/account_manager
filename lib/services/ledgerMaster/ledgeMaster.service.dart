import 'package:account_manager/business_logic/models/ledgermaster.models.dart';

abstract class LedgerMasterService {
  // Future<List<LedgerMaster>> getLedgerMasterList(databaseProvider);

  Future<int> insert(LedgerMaster ledgerMaster);
  // Future<LedgerMaster> update(LedgerMaster ledgerMaster);
  // Future<LedgerMaster> delete(LedgerMaster ledgerMaster);
}
