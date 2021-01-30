import 'package:account_manager/business_logic/models/trialBalance.model.dart';
import 'package:account_manager/services/ledgerTransaction/ledgerTransaction.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/foundation.dart';

class TrialBalanceViewModel extends ChangeNotifier {
  void calculateCash() async {
    LedgerTransactionService _ledgerTransactionService =
        serviceLocator<LedgerTransactionService>();
    // Step - 1 get all unique ids of all the ledger transaction
    final ledgerIds = await _ledgerTransactionService.getIds();
    print(ledgerIds.length.toString());

    //Step -2 get all the transaction of the ledger ids
    List<TrialBalance> ledgerTransactions = [];
    for (int i = 0; i < ledgerIds.length; i++) {
      int sumValue = 0;
      final list = await _ledgerTransactionService.getList(id: ledgerIds[i]);
      for (int j = 0; j < list.length; j++) {
        print(list[j].amount);
        sumValue = sumValue + list[j].amount;
      }

      ledgerTransactions
          .add(TrialBalance(ledgerId: ledgerIds[i], amount: sumValue));
    }
    for (int i = 0; i < ledgerTransactions.length; i++) {
      int id = ledgerTransactions[i].ledgerId;
      print('Ledger id:$id');
      int amount = ledgerTransactions[i].amount;
      print(ledgerTransactions[i].amount.toString());
      print('Amount is:$amount');
    }
  }

  // --Get all ledgers
  // --Calculate the balance of the ledger by substrating from each side which eever is bigger
}

//  1) Calculate profit in cash Account
// --Cash account id is 1 in the table
