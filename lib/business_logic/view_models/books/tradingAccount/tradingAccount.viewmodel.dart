import 'package:account_manager/business_logic/models/tradingAccount.models.dart';
import 'package:account_manager/services/ledgerTransaction/ledgerTransaction.service.dart';
import 'package:account_manager/services/serviceLocator.dart';
import 'package:flutter/cupertino.dart';

class TradingAccount extends ChangeNotifier {
  int openingStock; //Requires input from the user
  int closingStock; //Needs to be calculated
  int grossProfit;
  // ---Get all direct expenes
  List<DirectExpense> _directExpenseList = [];
  LedgerTransactionService _ledgerTransactionService =
      serviceLocator<LedgerTransactionService>();

  // ---Get all direct income
}
