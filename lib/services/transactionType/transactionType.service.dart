import 'package:account_manager/business_logic/models/transactionType.models.dart';

abstract class TransactionTypeService {
  //Future<List<TransactionType>> getLedgerMasterList(databaseProvider);
  Future<List<TransactionType>> getList();
  Future<int> insert(TransactionType ledgerMaster);
  Future<int> update(TransactionType ledgerMaster);
  Future<int> delete(int id);
}
