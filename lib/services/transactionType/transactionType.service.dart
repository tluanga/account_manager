import 'package:account_manager/business_logic/models/transactionType.models.dart';

import '../../business_logic/models/transactionType.models.dart';

abstract class TransactionTypeService {
  //Future<List<TransactionType>> getLedgerMasterList(databaseProvider);
  Future<List<TransactionType>> getList({int id = 0});
  Future<int> insert(TransactionType ledgerMaster);
  Future<int> update(TransactionType ledgerMaster);
  Future<int> delete(int id);
  Future<List<TransactionType>> getTransactionTypeList(String _searchString);
}
