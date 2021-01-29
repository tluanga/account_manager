import 'package:account_manager/services/ledgerTransaction/ledgerTransaction.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/foundation.dart';

class TrialBalanceViewModel extends ChangeNotifier {
  void calculateCash() async {
    LedgerTransactionService _ledgerTransactionService =
        serviceLocator<LedgerTransactionService>();
    // Step - 1 get all unique ids of all the ledger transaction
    var ledgerIds = _ledgerTransactionService.getIds();
    print(ledgerIds.toString());

    //Step -2 get all the transaction of the ledger ids
    // for(i=0;i<ledgerIds.length.toString())
    // var _return = _ledgerTransactionService.getList(id: 1);
    // print(_return.toString());
  }

  // --Get all ledgers
  // --Calculate the balance of the ledger by substrating from each side which eever is bigger
}

//  1) Calculate profit in cash Account
// --Cash account id is 1 in the table
