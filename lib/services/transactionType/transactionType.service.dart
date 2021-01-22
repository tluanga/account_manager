import 'package:account_manager/business_logic/models/transactionType.models.dart';

abstract class TransactionTypeService {
  Future<List<TransactionType>> getTransactionTypeList();

  Future<void> createNewTransactionType(TransactionType data);

  void setCurrentDebitSideLedger(int ledgerMasterId);
  int getCurrentDebitSideLedger();
  int getDebitSideLedger();

  void setCurrentCreditSideLedger(int ledgerMasterId);
  int getCurrentCreditSideLedger();
  int getCreditSideLedger();

  void clearSelectedLedgers();
}
