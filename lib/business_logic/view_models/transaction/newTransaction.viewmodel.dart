import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/services/transactionType/transactionType.service.dart';
import 'package:flutter/foundation.dart';

class NewTransactionViewModel extends ChangeNotifier {
  void newTransaction(
    int amount,
    String particulars,
    bool baOrBalo,
    bool cashOrBank,
    int transactionTypeId,
  ) {
    TransactionTypeService _transactionTypeService =
        serviceLocator<TransactionTypeService>();
    // step1--get the id of debit side ledger

    // step 2- make ledger Transaction
    // step 3- get the id of the credit side ledger
    // step 4- make the ledger Transaction
    // Calculation
    // create a ledger transaction
  }

  // int getSelectedTransactionType() {
  //   return selectedTransactionType;
  // }

  // String getSelectedTransactionTypeName() {
  //   int id = selectedTransactionType;
  //   print(id);
  //   TransactionType temp = searchTransactionType(id);

  //   return temp.name;
  //   // -----Get the name of the transaction Type
  // }
}
