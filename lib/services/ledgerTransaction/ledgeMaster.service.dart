import 'package:account_manager/business_logic/models/ledgerTransaction.model.dart';

abstract class LedgerTransactionService {
  Future<List<LedgerTransaction>> getLedgerTransactionList();

  Future<void> createNewLedgerTransaction(LedgerTransaction data);
}
