import 'package:account_manager/Data/transaction.data.dart';
import 'package:account_manager/Data/transactionType.data.dart';
import 'package:account_manager/business_logic/models/ledgermaster.models.dart';

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
    LedgerMaster debitSideLedgerId =
        getTransactionTypeDebitSideLedger(transactionTypeId);
    // step1--get the id of debit side ledger

    // step 2- make ledger Transaction
    // step 3- get the id of the credit side ledger
    // step 4- make the ledger Transaction
    // Calculation
    // create a ledger transaction
  }

  int getSelectedTransactionType() {
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
