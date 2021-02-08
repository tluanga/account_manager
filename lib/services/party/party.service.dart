import 'package:account_manager/business_logic/models/ledgermaster.models.dart';
import 'package:account_manager/business_logic/models/party.model.dart';

abstract class PartyService {
  //Future<List<LedgerMaster>> getLedgerMasterList(databaseProvider);
  Future<List<Party>> getList();
  Future<int> insert(Party party);
  Future<int> update(Party party);
  Future<int> delete(int id);
  void setSelectedParty(LedgerMaster _ledgerMaster);
  LedgerMaster getSelectedParty();
}
