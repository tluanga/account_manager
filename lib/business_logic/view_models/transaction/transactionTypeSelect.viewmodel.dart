import 'package:account_manager/Data/transaction.data.dart';
import 'package:flutter/foundation.dart';

class TransactionTypeSelectViewModel extends ChangeNotifier {
  void setTransactionType(int id) {
    selectedTransactionType = id;
  }
}
