import 'package:account_manager/services/Reports/tradingAccount/tradingAccount/tradingAccount.service.dart';
import 'package:account_manager/services/ledgerTransaction/ledgerTransaction.service.dart';

import 'package:account_manager/services/serviceLocator.dart';

import 'package:flutter/cupertino.dart';

class TradingAccountViewModel extends ChangeNotifier {
  int openingStock; //Requires input from the user
  int closingStock; //Needs to be calculated
  int grossProfit;
  TradingAccountService _tradingAccountService =
      serviceLocator<TradingAccountService>();
  LedgerTransactionService _ledgerTransactionService =
      serviceLocator<LedgerTransactionService>();
  // ---Get all direct expenes
  // ignore: unused_field
  // List<DirectExpense> _directExpenseList = [];
  // // ignore: unused_field
  // LedgerTransactionService _ledgerTransactionService =
  //     serviceLocator<LedgerTransactionService>();
  // TradingAccountService _tradingAccountService =
  //     serviceLocator<TradingAccountService>();

  void loadData() async {
    _tradingAccountService.getDirectIncomeData();
    // ignore: unused_local_variable
    var _ledgerTransaction = await _ledgerTransactionService.getList();
  }

  // ---Get all direct income
}
