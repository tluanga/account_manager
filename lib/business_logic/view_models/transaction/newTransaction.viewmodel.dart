import 'package:account_manager/Data/transaction.data.dart';
import 'package:account_manager/Data/transactionType.data.dart';

import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:flutter/foundation.dart';

class NewTransactionViewModel extends ChangeNotifier {
  void newTransaction(
    int amount,
    String particulars,
    bool baOrBalo,
    bool cashOrBank,
    int transactionTypeId,
  ) {
    // Calculation
    // create a ledger transaction
  }

  int getSelectedTransacitionType() {
    return selectedTransactionType;
  }

  String getSelectedTransactionTypeName() {
    int id = selectedTransactionType;
    print(id);
    TransactionType temp = searchTransactionType(id);

    return temp.name;
    // -----Get the name of the transaction Type
  }
}
