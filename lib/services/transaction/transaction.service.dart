import 'package:account_manager/business_logic/models/transaction.model.dart';

// abstract class TransactionService {
//   Future<List<Transaction>> getTransactionList();

//   Future<void> createNewTransaction(Transaction data);
// }

abstract class TransactionService {
  //Future<List<LedgerMaster>> getLedgerMasterList(databaseProvider);
  Future<List<Transaction>> getList();
  Future<int> insert(Transaction transaction);
  Future<int> update(Transaction transaction);
  Future<int> delete(int id);
}
