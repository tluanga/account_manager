import 'package:account_manager/business_logic/models/ledgerTransaction.model.dart';

abstract class LedgerTransactionService {
  //Future<List<LedgerMaster>> getLedgerMasterList(databaseProvider);
  Future<List<LedgerTransaction>> getList(
      {int id = 0, DateTime startDate, DateTime endDate});

  Future<int> insert(LedgerTransaction ledgerTransaction);
  Future<int> update(LedgerTransaction ledgerTransaction);
  Future<int> delete(int id);
}
