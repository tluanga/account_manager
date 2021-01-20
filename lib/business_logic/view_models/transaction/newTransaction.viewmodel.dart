import 'package:account_manager/Data/transaction.data.dart';
import 'package:account_manager/Data/transactionType.data.dart';
import 'package:account_manager/business_logic/models/transaction.model.dart';
import 'package:flutter/foundation.dart';

class NewTransactionViewModel extends ChangeNotifier {
  void newTransaction(Transaction transaction) {
    transactionListData.add(transaction);
  }

  int getSelectedTransacitionType() {
    return selectedTransactionType;
  }

  String getSelectedTransactionTypeName() {
    int id = selectedTransactionType;
    // -----Get the name of the transaction Type
    // List Name=transactionTypesData.where((transactionType) => transactionType.id==id) ;
  }
}
