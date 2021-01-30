import 'package:account_manager/business_logic/models/trialBalance.model.dart';
import 'package:account_manager/services/ledgerMaster/ledgeMaster.service.dart';
import 'package:account_manager/services/ledgerTransaction/ledgerTransaction.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/foundation.dart';

class TrialBalanceViewModel extends ChangeNotifier {
  List<TrialBalance> trialBalanceElements = [];

  void loadData() async {
    LedgerTransactionService _ledgerTransactionService =
        serviceLocator<LedgerTransactionService>();
    LedgerMasterService _ledgerMasterService =
        serviceLocator<LedgerMasterService>();
    // Step - 1 get all unique ids of all the ledger transaction
    final ledgerIds = await _ledgerTransactionService.getIds();
    print(ledgerIds.length.toString());

    final ledgerMasterList = await _ledgerMasterService.getList();
    //Step -2 get all the transaction of the ledger ids
    List<TrialBalance> ledgerTransactions = [];
    for (int i = 0; i < ledgerIds.length; i++) {
      int sumValue = 0;
      String ledgerName = '';
      final list = await _ledgerTransactionService.getList(id: ledgerIds[i]);
      var ledgerMaster =
          ledgerMasterList.firstWhere((element) => element.id == ledgerIds[i]);
      ledgerName = ledgerMaster.name;

      for (int j = 0; j < list.length; j++) {
        print(list[j].amount);
        sumValue = sumValue + list[j].amount;
      }

      ledgerTransactions.add(TrialBalance(
          ledgerId: ledgerIds[i], ledgerName: ledgerName, amount: sumValue));
    }
    //--Printing Trial Balance Element
    for (int i = 0; i < ledgerTransactions.length; i++) {
      int id = ledgerTransactions[i].ledgerId;
      String name = ledgerTransactions[i].ledgerName;
      print('Ledger id:$id');
      int amount = ledgerTransactions[i].amount;
      print(ledgerTransactions[i].amount.toString());
      print('Amount is:$amount');
      print('ledger Name:$name');
    }
    trialBalanceElements = ledgerTransactions;
    notifyListeners();
  }

  // --Get all ledgers
  // --Calculate the balance of the ledger by substrating from each side which eever is bigger
}

//  1) Calculate profit in cash Account
// --Cash account id is 1 in the table
