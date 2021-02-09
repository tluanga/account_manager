import 'package:account_manager/business_logic/models/ledgermaster.models.dart';

abstract class LedgerMasterService {
  //Future<List<LedgerMaster>> getLedgerMasterList(databaseProvider);
  Future<List<LedgerMaster>> getList();
  Future<LedgerMaster> getLedgerMaster(int id);
  Future<int> insert(LedgerMaster ledgerMaster);
  Future<int> update(LedgerMaster ledgerMaster);
  Future<int> delete(int id);
  Future<String> getLedgerMasterName(int _id);
  Future<List<LedgerMaster>> getPartyList();
  Future<List<LedgerMaster>> getAssetLedgerList();
  Future<List<LedgerMaster>> getFilterdLedgerList(String _searchString);
  Future<List<LedgerMaster>> getFilterdPartyLedgerList(String _searchString);

  Future<List<LedgerMaster>> getFilteredAssetLedgerList(String _searchString);
  Future<List<LedgerMaster>> getTopTenLedgerList();
}
