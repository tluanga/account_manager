import 'package:account_manager/business_logic/models/transactionType.models.dart';

abstract class TransactionTypeService {
  Future<List<TransactionType>> getTransactionTypeList();

  Future<void> createNewTransactionType(TransactionType data);
}
