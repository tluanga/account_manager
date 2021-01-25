import 'package:account_manager/business_logic/models/ledgerTransaction.model.dart';
import 'package:account_manager/business_logic/models/transactionType.models.dart';
import 'package:account_manager/services/ledgerTransaction/ledgeMaster.service.dart';

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

    // 1. Get Transaction Type Object
    TransactionType transactionType;
    // transactionType =
    //     _transactionTypeService.getTransactionTypeObject(transactionTypeId);
    // print(
    //   transactionType.creditSideLedger,
    // );
    // Create a ledgerTransaction Entry
    LedgerTransaction ledgerTransactionData =
        new LedgerTransaction(id: 12, amount: 1000);
    LedgerTransactionService _ledgerTransactionService =
        serviceLocator<LedgerTransactionService>();
    _ledgerTransactionService.insert(ledgerTransactionData);

    // Transaction type hnuaia debitLedger and creditLedger kan mamawh
    // we have the transaction id

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
