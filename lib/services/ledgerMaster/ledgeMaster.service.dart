import 'package:account_manager/business_logic/models/ledgermaster.models.dart';

abstract class LedgerMasterService {
  //Future<List<LedgerMaster>> getLedgerMasterList(databaseProvider);
  Future<List<LedgerMaster>> getList();
  Future<int> insert(LedgerMaster ledgerMaster);
  Future<int> update(LedgerMaster ledgerMaster);
  Future<int> delete(int id);
  Future<List<LedgerMaster>> getPartyList();
}
