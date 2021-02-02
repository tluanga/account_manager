import 'package:account_manager/business_logic/models/tradingAccount.models.dart';
import 'package:account_manager/services/ledgerTransaction/ledgerTransaction.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:account_manager/services/tradingAccount/tradingAccount.service.dart';
import 'package:flutter/cupertino.dart';

class TradingAccountViewModel extends ChangeNotifier {
  int openingStock; //Requires input from the user
  int closingStock; //Needs to be calculated
  int grossProfit;
  // ---Get all direct expenes
  // ignore: unused_field
  List<DirectExpense> _directExpenseList = [];
  // ignore: unused_field
  LedgerTransactionService _ledgerTransactionService =
      serviceLocator<LedgerTransactionService>();
  TradingAccountService _tradingAccountService =
      serviceLocator<TradingAccountService>();

  void loadData() async {
    _directExpenseList = await _tradingAccountService.getDirectExpense();
  }

  // ---Get all direct income
}
