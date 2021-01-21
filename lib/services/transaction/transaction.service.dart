import 'package:account_manager/business_logic/models/transaction.model.dart';

abstract class TransactionService {
  Future<List<Transaction>> getTransactionList();

  Future<void> createNewTransactione(Transaction data);
}
