import 'package:account_manager/business_logic/models/transaction.model.dart';
import 'package:flutter/foundation.dart';

class TransactionViewModel extends ChangeNotifier {
  List<Transaction> transactionList = [];
  void addTransaction(Transaction transaction) {
    transactionList.add(transaction);
  }
}
