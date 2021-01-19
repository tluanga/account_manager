import 'package:account_manager/Data/transaction.data.dart';
import 'package:account_manager/business_logic/models/transaction.model.dart';
import 'package:flutter/foundation.dart';

class NewTransactionViewModel extends ChangeNotifier {
  void newTransaction(Transaction transaction) {
    transactionListData.add(transaction);
  }
}
