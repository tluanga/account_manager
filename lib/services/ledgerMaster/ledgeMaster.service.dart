import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/services/database/databaseProvider.service.dart';

abstract class LedgerMasterService {
  DatabaseProvider databaseProvider;

  Future<List<LedgerMaster>> getLedgerMasterList();

  Future<LedgerMaster> insert(LedgerMaster ledgerMaster);
  Future<LedgerMaster> update(LedgerMaster ledgerMaster);
  Future<LedgerMaster> delete(LedgerMaster ledgerMaster);
}
